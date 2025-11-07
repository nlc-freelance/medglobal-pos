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

# Step 1: Copy custom HTTP headers config to build output
if [ -f "customHttp.yml" ]; then
  echo "📋 Copying custom headers configuration..."
  cp customHttp.yml build/web/
  echo "✅ customHttp.yml added to build output"
fi

# Step 2: Create a zip file of the build output
BUILD_DIR="build/web"
ZIP_FILE="amplify-deploy-${ENV_NAME}.zip"

echo "📦 Creating deployment package..."
cd "$BUILD_DIR"
zip -r "../../${ZIP_FILE}" .
cd ../..

echo "✅ Deployment package created: ${ZIP_FILE}"

# Step 3: Create deployment and get upload URL
echo "🔗 Creating deployment job..."
DEPLOYMENT_RESPONSE=$(aws amplify create-deployment \
  --app-id "$AMPLIFY_APP_ID" \
  --branch-name "$ENV_NAME" \
  --output json)

JOB_ID=$(echo "$DEPLOYMENT_RESPONSE" | jq -r '.jobId')
ZIP_UPLOAD_URL=$(echo "$DEPLOYMENT_RESPONSE" | jq -r '.zipUploadUrl')

echo "✅ Deployment job created: $JOB_ID"

# Step 4: Upload the zip file to the provided URL
echo "⬆️ Uploading build artifacts..."
curl -X PUT \
  -H "Content-Type: application/zip" \
  --data-binary "@${ZIP_FILE}" \
  "$ZIP_UPLOAD_URL"

echo "✅ Build artifacts uploaded successfully"

# Step 5: Start the deployment
echo "🚀 Starting deployment..."
aws amplify start-deployment \
  --app-id "$AMPLIFY_APP_ID" \
  --branch-name "$ENV_NAME" \
  --job-id "$JOB_ID"

echo "✅ Amplify deployment started for $ENV_NAME (Job ID: $JOB_ID)"
echo "💡Check deployment status in AWS Amplify Console"

# Cleanup
rm -f "$ZIP_FILE"
echo "🧹 Cleaned up temporary files"
