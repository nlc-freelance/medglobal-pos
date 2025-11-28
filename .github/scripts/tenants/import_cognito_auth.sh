#!/usr/bin/env bash
set -e

# Validate required environment variables
if [ -z "$COGNITO_POOL_ID" ] || [ -z "$COGNITO_CLIENT_ID" ] || [ -z "$AWS_REGION" ]; then
  echo "❌ Error: COGNITO_POOL_ID, COGNITO_CLIENT_ID, and AWS_REGION environment variables are required"
  exit 1
fi

echo "🔐 Importing Cognito User Pool to Amplify backend"
echo "   Pool ID: $COGNITO_POOL_ID"
echo "   Client ID: $COGNITO_CLIENT_ID"
echo "   Region: $AWS_REGION"

# Check if auth already imported
if amplify status 2>/dev/null | grep -q "auth.*Imported"; then
  echo "⚠️  Auth already imported, skipping..."
  exit 0
fi

echo ""
echo "📥 Importing Cognito authentication..."

# Import auth using headless mode with JSON
cat << EOF | jq -c | amplify import auth --headless
{
  "version": 1,
  "userPoolId": "$COGNITO_POOL_ID",
  "webClientId": "$COGNITO_CLIENT_ID",
  "nativeClientId": "$COGNITO_CLIENT_ID"
}
EOF

echo ""
echo "☁️  Pushing auth configuration to AWS..."
amplify push --yes

echo ""
echo "📥 Pulling configuration to generate amplifyconfiguration.dart..."

# Get project name from amplify config (remove hyphens for Amplify project name)
PROJECT_NAME=$(cat amplify/.config/project-config.json | jq -r '.projectName // "medglobalportal"')
AMPLIFY_APP_ID=$(cat amplify/backend/amplify-meta.json | jq -r '.providers.awscloudformation.AmplifyAppId')

amplify pull \
  --appId "$AMPLIFY_APP_ID" \
  --envName dev \
  --yes \
  --amplify "{\"projectName\":\"${PROJECT_NAME}\",\"envName\":\"dev\",\"defaultEditor\":\"code\"}" \
  --frontend "{\"frontend\":\"flutter\",\"config\":{\"ResDir\":\"lib/\"}}" \
  --providers "{\"awscloudformation\":{\"configLevel\":\"project\",\"useProfile\":false,\"region\":\"${AWS_REGION}\"}}"

echo ""
echo "✅ Cognito User Pool imported successfully"
echo "   Authentication configured for both web and native clients"
echo "   Tenant-specific configuration generated at lib/amplifyconfiguration.dart"
