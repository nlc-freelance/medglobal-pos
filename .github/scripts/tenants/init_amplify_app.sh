#!/usr/bin/env bash
set -e

# Validate required environment variables
if [ -z "$TENANT_NAME" ] || [ -z "$AWS_REGION" ]; then
  echo "❌ Error: TENANT_NAME and AWS_REGION environment variables are required"
  exit 1
fi

echo "🚀 Initializing Amplify app and backend for tenant: $TENANT_NAME"
echo "   Region: $AWS_REGION"

APP_NAME="medglobal-portal-${TENANT_NAME}"
# Project name for local Amplify CLI (no hyphens allowed)
PROJECT_NAME="medglobalportal${TENANT_NAME}"

# Check if already initialized
if [ -d "amplify" ] && [ -f "amplify/.config/project-config.json" ]; then
  echo "⚠️  Amplify already initialized"

  # Get AppId from team-provider-info.json (correct location)
  # Try to get environment name from local-env-info.json, default to "dev"
  ENV_NAME=$(cat amplify/.config/local-env-info.json 2>/dev/null | jq -r '.envName' || echo "dev")
  APP_ID=$(cat amplify/team-provider-info.json | jq -r ".${ENV_NAME}.awscloudformation.AmplifyAppId // empty")

  if [ -z "$APP_ID" ]; then
    echo "   ⚠️  No AmplifyAppId found in team-provider-info.json for environment: $ENV_NAME"
    exit 1
  fi

  echo "   Using existing App ID: $APP_ID"
  echo "AMPLIFY_APP_ID=$APP_ID" >> $GITHUB_OUTPUT
  exit 0
fi

echo "📦 Creating Amplify app with name: $APP_NAME"

# Step 1: Create the Amplify app using AWS CLI (supports hyphens in name)
# Note: Not connecting to repository (no --repository flag) since we do manual deployments
CREATE_APP_OUTPUT=$(aws amplify create-app \
  --name "$APP_NAME" \
  --platform WEB \
  --region "$AWS_REGION" \
  --tags "tenant=${TENANT_NAME},environment=dev,managed-by=github-actions" \
  --output json)

APP_ID=$(echo "$CREATE_APP_OUTPUT" | jq -r '.app.appId')

if [ -z "$APP_ID" ] || [ "$APP_ID" = "null" ]; then
  echo "❌ Error: Failed to create Amplify app"
  echo "   AWS CLI output: $CREATE_APP_OUTPUT"
  exit 1
fi

echo "   ✅ Amplify app created with ID: $APP_ID"
echo "   App name in AWS Console: $APP_NAME"
echo "   Note: Repository connection not configured (manual deployment mode)"

echo "📦 Initializing local Amplify project..."

# Step 2: Initialize Amplify CLI locally (connects to existing app)
amplify init \
  --amplify "{\"projectName\":\"${PROJECT_NAME}\",\"envName\":\"dev\",\"defaultEditor\":\"vscode\",\"appId\":\"${APP_ID}\"}" \
  --providers "{\"awscloudformation\":{\"configLevel\":\"general\",\"useProfile\":false,\"region\":\"${AWS_REGION}\"}}" \
  --yes

# Extract App ID from amplify-meta.json to verify initialization
EXTRACTED_APP_ID=$(cat amplify/backend/amplify-meta.json | jq -r '.providers.awscloudformation.AmplifyAppId')

# Validate App ID was extracted successfully and matches
if [ -z "$EXTRACTED_APP_ID" ] || [ "$EXTRACTED_APP_ID" = "null" ]; then
  echo "❌ Error: Failed to extract AmplifyAppId from Amplify configuration"
  echo "   This usually means amplify init did not complete successfully"
  exit 1
fi

if [ "$EXTRACTED_APP_ID" != "$APP_ID" ]; then
  echo "⚠️  Warning: Extracted App ID ($EXTRACTED_APP_ID) doesn't match created App ID ($APP_ID)"
  echo "   Using created App ID: $APP_ID"
fi

echo ""
echo "✅ Amplify app and backend initialized successfully"
echo "   App Name: $APP_NAME"
echo "   App ID: $APP_ID"
echo "   Environment: dev"
echo "   Default Domain: ${APP_ID}.amplifyapp.com"

# Output for GitHub Actions
echo "AMPLIFY_APP_ID=$APP_ID" >> $GITHUB_OUTPUT
echo "AMPLIFY_DEFAULT_DOMAIN=${APP_ID}.amplifyapp.com" >> $GITHUB_OUTPUT
