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

# Capture HTTP status code and upload with retry logic
HTTP_CODE=$(curl -X PUT \
  -H "Content-Type: application/zip" \
  --data-binary "@${ZIP_FILE}" \
  --fail \
  --silent \
  --show-error \
  --write-out "%{http_code}" \
  --retry 3 \
  --retry-delay 2 \
  --retry-all-errors \
  "$ZIP_UPLOAD_URL" 2>&1 | tail -n 1)

# Validate upload succeeded
if [ "$HTTP_CODE" != "200" ]; then
  echo "❌ ERROR: Upload failed with HTTP status code: $HTTP_CODE"
  echo "   Deployment artifacts could not be uploaded to S3"
  echo "   This may indicate:"
  echo "   - S3 bucket ACLs are disabled (check bucket Object Ownership settings)"
  echo "   - Presigned URL expired or is invalid"
  echo "   - Network connectivity issues"
  echo ""
  echo "💡 To diagnose:"
  echo "   1. Check S3 bucket ACL settings in AWS Console"
  echo "   2. Verify Amplify app platform type is WEB (not WEB_DYNAMIC)"
  echo "   3. Check IAM role has s3:PutObject permissions"
  rm -f "$ZIP_FILE"
  exit 1
fi

echo "✅ Build artifacts uploaded successfully (HTTP $HTTP_CODE)"

# Step 4: Start the deployment
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
    echo "🌐 Your app is deployed at: https://${ENV_NAME}.${AMPLIFY_APP_ID}.amplifyapp.com"

    # Cleanup
    rm -f "$ZIP_FILE"
    echo "🧹 Cleaned up temporary files"
    exit 0
  elif [ "$JOB_STATUS" = "FAILED" ] || [ "$JOB_STATUS" = "CANCELLED" ]; then
    echo ""
    echo "❌ ERROR: Deployment failed with status: $JOB_STATUS"
    echo ""
    echo "📋 To view detailed logs:"
    echo "   1. Go to AWS Amplify Console: https://console.aws.amazon.com/amplify/home?region=${AWS_REGION:-us-east-1}#/${AMPLIFY_APP_ID}/${ENV_NAME}/${JOB_ID}"
    echo "   2. Or run: aws amplify get-job --app-id $AMPLIFY_APP_ID --branch-name $ENV_NAME --job-id $JOB_ID"
    echo ""
    echo "💡 Common causes:"
    echo "   - S3 bucket ACLs disabled (MissingBuildArtifacts error)"
    echo "   - Platform type mismatch (WEB_DYNAMIC instead of WEB)"
    echo "   - Build artifacts not found in S3"

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
