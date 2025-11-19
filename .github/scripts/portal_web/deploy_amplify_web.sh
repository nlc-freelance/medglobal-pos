#!/usr/bin/env bash
set -e

# Read from environment variables
if [ -z "$ENV_NAME" ] || [ -z "$AMPLIFY_APP_ID" ]; then
  echo "❌ Error: ENV_NAME and AMPLIFY_APP_ID environment variables are required"
  exit 1
fi

echo "⚙️ Install manual deployment dependencies"

echo "📦 Installing jq for JSON parsing..."

sudo apt-get update && sudo apt-get install -y jq

# Step 1: Create a zip file of the build output
BUILD_DIR="build/web"
ZIP_FILE="amplify-deploy-${ENV_NAME}.zip"

echo "📦 Creating deployment package..."
cd "$BUILD_DIR"
zip -r "../../${ZIP_FILE}" .
cd ../..

echo "✅ Deployment package created: ${ZIP_FILE}"

# Step 2: Create deployment and get upload URL
echo "🔗 Creating deployment job..."
DEPLOYMENT_RESPONSE=$(aws amplify create-deployment \
  --app-id "$AMPLIFY_APP_ID" \
  --branch-name "$ENV_NAME" \
  --output json)

JOB_ID=$(echo "$DEPLOYMENT_RESPONSE" | jq -r '.jobId')
ZIP_UPLOAD_URL=$(echo "$DEPLOYMENT_RESPONSE" | jq -r '.zipUploadUrl')

echo "✅ Deployment job created: $JOB_ID"

# Step 3: Upload the zip file to the provided URL with error handling
echo "⬆️ Uploading build artifacts..."

# Capture both response body and HTTP code for detailed error detection
UPLOAD_RESPONSE=$(curl -X PUT \
  -H "Content-Type: application/zip" \
  --data-binary "@${ZIP_FILE}" \
  --write-out "\n%{http_code}" \
  --silent \
  --show-error \
  --retry 3 \
  --retry-delay 2 \
  --retry-all-errors \
  "$ZIP_UPLOAD_URL" 2>&1)

# Extract HTTP code from last line
HTTP_CODE=$(echo "$UPLOAD_RESPONSE" | tail -n 1)
RESPONSE_BODY=$(echo "$UPLOAD_RESPONSE" | sed '$d')

# Validate HTTP status code
if [ "$HTTP_CODE" != "200" ]; then
  echo "❌ ERROR: Upload failed with HTTP status code: $HTTP_CODE"
  if [ -n "$RESPONSE_BODY" ]; then
    echo "   $RESPONSE_BODY"
  fi
  rm -f "$ZIP_FILE"
  exit 1
fi

# Check for embedded errors in 200 response (S3 can return HTTP 200 with XML errors)
if echo "$RESPONSE_BODY" | grep -q "<Error>"; then
  echo "❌ ERROR: S3 returned error despite HTTP 200"
  echo "   $RESPONSE_BODY"
  rm -f "$ZIP_FILE"
  exit 1
fi

echo "✅ Build artifacts uploaded successfully (HTTP $HTTP_CODE)"

# Step 4: Verify artifact exists in S3
echo "🔍 Verifying artifact in S3..."

# Extract bucket name and S3 key from presigned URL
BUCKET_NAME=$(echo "$ZIP_UPLOAD_URL" | sed 's|https://\([^.]*\)\.s3\..*|\1|')
S3_KEY=$(echo "$ZIP_UPLOAD_URL" | sed 's|.*amazonaws.com/\([^?]*\).*|\1|')

# Verify with retries (S3 is strongly consistent, but adding verification for safety)
MAX_VERIFY_ATTEMPTS=5
for i in $(seq 1 $MAX_VERIFY_ATTEMPTS); do
  if aws s3api head-object --bucket "$BUCKET_NAME" --key "$S3_KEY" > /dev/null 2>&1; then
    echo "✅ Artifact verified in S3"
    break
  fi

  if [ $i -lt $MAX_VERIFY_ATTEMPTS ]; then
    echo "   Verification attempt $i/$MAX_VERIFY_ATTEMPTS, retrying..."
    sleep 2
  else
    echo "❌ ERROR: Artifact not found in S3 after upload"
    echo "   Upload may have failed despite HTTP 200 response"
    rm -f "$ZIP_FILE"
    exit 1
  fi
done

# Step 5: Wait for Amplify internal processing
echo "⏱️  Waiting for Amplify internal processing (5s)..."
sleep 5

# Step 6: Start the deployment
echo "🚀 Starting deployment..."
START_DEPLOYMENT_OUTPUT=$(aws amplify start-deployment \
  --app-id "$AMPLIFY_APP_ID" \
  --branch-name "$ENV_NAME" \
  --job-id "$JOB_ID" \
  --output json)

echo "✅ Amplify deployment started for $ENV_NAME (Job ID: $JOB_ID)"

# Step 5: Wait for deployment to complete and verify status
echo "⏳ Waiting for deployment to complete..."
echo "   (This may take 2-5 minutes)"

MAX_WAIT_TIME=600  # 10 minutes timeout
POLL_INTERVAL=15   # Check every 15 seconds
ELAPSED_TIME=0

while [ $ELAPSED_TIME -lt $MAX_WAIT_TIME ]; do
  # Get current job status
  JOB_STATUS=$(aws amplify get-job \
    --app-id "$AMPLIFY_APP_ID" \
    --branch-name "$ENV_NAME" \
    --job-id "$JOB_ID" \
    --output json | jq -r '.job.summary.status')

  echo "   Status: $JOB_STATUS (${ELAPSED_TIME}s elapsed)"

  # Check if deployment completed
  if [ "$JOB_STATUS" = "SUCCEED" ]; then
    echo ""
    echo "✅ Deployment completed successfully!"
    echo "   App ID: $AMPLIFY_APP_ID"
    echo "   Job ID: $JOB_ID"
    echo "   Branch: $ENV_NAME"
    echo ""

    # Resolve portal URL (custom domain or default)
    echo "🔍 Resolving portal URL..."

    # Try to get custom domain for this branch
    CUSTOM_URL=$(aws amplify list-domain-associations \
      --app-id "$AMPLIFY_APP_ID" \
      --output json 2>/dev/null | jq -r \
      --arg branch "$ENV_NAME" \
      '.domainAssociations[] |
       select(.domainStatus == "AVAILABLE") |
       . as $domain |
       .subDomains[] |
       select(.subDomainSetting.branchName == $branch and .verified == true) |
       if .subDomainSetting.prefix == "" then
         "https://" + $domain.domainName
       else
         "https://" + .subDomainSetting.prefix + "." + $domain.domainName
       end' 2>/dev/null | head -n 1)

    # Fallback to default Amplify URL if no custom domain found
    if [ -n "$CUSTOM_URL" ] && [ "$CUSTOM_URL" != "null" ] && [ "$CUSTOM_URL" != "" ]; then
      PORTAL_URL="$CUSTOM_URL"
      echo "   Using custom domain: $PORTAL_URL"
    else
      PORTAL_URL="https://${ENV_NAME}.${AMPLIFY_APP_ID}.amplifyapp.com"
      echo "   Using default Amplify URL: $PORTAL_URL"
    fi

    echo ""
    echo "🌐 Your app is deployed at: $PORTAL_URL"

    # Export portal URL for GitHub Actions to capture
    echo "PORTAL_URL=$PORTAL_URL" >> $GITHUB_OUTPUT

    # Cleanup
    rm -f "$ZIP_FILE"
    echo "🧹 Cleaned up temporary files"
    exit 0
  elif [ "$JOB_STATUS" = "FAILED" ] || [ "$JOB_STATUS" = "CANCELLED" ]; then
    echo ""
    echo "❌ ERROR: Deployment failed with status: $JOB_STATUS"

    # Get actual error details from the job
    JOB_DETAILS=$(aws amplify get-job \
      --app-id "$AMPLIFY_APP_ID" \
      --branch-name "$ENV_NAME" \
      --job-id "$JOB_ID" \
      --output json 2>/dev/null)

    # Extract and display error message if available
    if [ -n "$JOB_DETAILS" ]; then
      ERROR_MSG=$(echo "$JOB_DETAILS" | jq -r '.job.summary.jobArn // empty' 2>/dev/null)
      if [ -n "$ERROR_MSG" ]; then
        echo ""
        echo "View details: https://console.aws.amazon.com/amplify/home?region=${AWS_REGION:-ap-southeast-1}#/${AMPLIFY_APP_ID}/${ENV_NAME}/${JOB_ID}"
      fi
    fi

    # Cleanup
    rm -f "$ZIP_FILE"
    exit 1
  fi

  # Wait before next poll
  sleep $POLL_INTERVAL
  ELAPSED_TIME=$((ELAPSED_TIME + POLL_INTERVAL))
done

# Timeout reached
echo ""
echo "⚠️  WARNING: Deployment verification timed out after ${MAX_WAIT_TIME}s"
echo "   The deployment may still be in progress"
echo "   Current status: $JOB_STATUS"
echo ""
echo "💡 Check deployment status manually:"
echo "   aws amplify get-job --app-id $AMPLIFY_APP_ID --branch-name $ENV_NAME --job-id $JOB_ID"

# Cleanup
rm -f "$ZIP_FILE"
echo "🧹 Cleaned up temporary files"

# Exit with warning status (deployment may still succeed)
exit 0
