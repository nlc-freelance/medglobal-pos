#!/usr/bin/env bash
set -e

# Remove any existing amplify/ folder and tenant-specific config to prevent conflicts
echo "🗑️ Removing previous amplify/ folder and config to pull fresh configuration"
if [ -d "amplify" ]; then
  rm -rf amplify
  echo "   ✅ Removed previous amplify/ config"
else
  echo "   ℹ️  No amplify/ folder found (already clean)"
fi

if [ -f "lib/amplifyconfiguration.dart" ]; then
  rm -f lib/amplifyconfiguration.dart
  echo "   ✅ Removed previous amplifyconfiguration.dart"
else
  echo "   ℹ️  No amplifyconfiguration.dart found (already clean)"
fi

# Validate required environment variables
if [ -z "$AMPLIFY_APP_ID" ] || [ -z "$TENANT_NAME" ] || [ -z "$AWS_REGION" ]; then
  echo "❌ Error: AMPLIFY_APP_ID, TENANT_NAME, and AWS_REGION environment variables are required"
  exit 1
fi

echo "📥 Pulling Amplify configuration for tenant: $TENANT_NAME"
echo "   App ID: $AMPLIFY_APP_ID"
echo "   Region: $AWS_REGION"

# Project name for local Amplify CLI (no hyphens allowed)
PROJECT_NAME="medglobalpos${TENANT_NAME}"

# Step 1: Pull Amplify configuration from existing app
amplify pull \
  --amplify "{\"projectName\":\"${PROJECT_NAME}\",\"envName\":\"${ENV_NAME}\",\"appId\":\"${AMPLIFY_APP_ID}\"}" \
  --frontend "{\"frontend\":\"flutter\",\"config\":{\"ResDir\":\"./lib/\"}}" \
  --providers "{\"awscloudformation\":{\"configLevel\":\"general\",\"useProfile\":false,\"region\":\"${AWS_REGION}\"}}" \
  --yes

# Verify the configuration was pulled successfully
if [ ! -d "amplify" ] || [ ! -f "amplify/.config/project-config.json" ]; then
  echo "❌ Error: Failed to pull Amplify configuration"
  echo "   amplify/ directory or project-config.json not found"
  exit 1
fi

if [ ! -f "lib/amplifyconfiguration.dart" ]; then
  echo "❌ Error: Failed to pull Amplify configuration"
  echo "   lib/amplifyconfiguration.dart not found"
  exit 1
fi

# Extract App ID from configuration to verify it matches
EXTRACTED_APP_ID=$(cat amplify/backend/amplify-meta.json 2>/dev/null | jq -r '.providers.awscloudformation.AmplifyAppId // empty' || echo "")

if [ -z "$EXTRACTED_APP_ID" ]; then
  echo "⚠️  Warning: Could not extract AmplifyAppId from amplify-meta.json for verification"
elif [ "$EXTRACTED_APP_ID" != "$AMPLIFY_APP_ID" ]; then
  echo "⚠️  Warning: Extracted App ID ($EXTRACTED_APP_ID) doesn't match expected App ID ($AMPLIFY_APP_ID)"
else
  echo "   ✅ App ID verification successful"
fi

echo ""
echo "✅ Amplify configuration pulled successfully"
echo "   App ID: $AMPLIFY_APP_ID"
echo "   Tenant: $TENANT_NAME"
