#!/bin/bash
set -e

# Validate required environment variables
if [ -z "$ENV_NAME" ] || [ -z "$BASE_URL" ] || [ -z "$AMPLIFY_APP_ID" ] || [ -z "$COGNITO_POOL_ID" ] || [ -z "$COGNITO_CLIENT_ID" ]; then
  echo "❌ Error: Required environment variables are not set"
  echo "   Required: ENV_NAME, BASE_URL, AMPLIFY_APP_ID, COGNITO_POOL_ID, COGNITO_CLIENT_ID"
  exit 1
fi

echo "⚙️ Setting up environment for $ENV_NAME"

# Extract version and build number
VERSION_LINE=$(grep '^version:' pubspec.yaml)
VERSION=$(echo "$VERSION_LINE" | cut -d '+' -f 1 | awk '{print $2}')
BUILD_NUMBER=$(echo "$VERSION_LINE" | cut -d '+' -f 2)

cat > .env <<EOL
BASE_URL=${BASE_URL}
AMPLIFY_APP_ID=${AMPLIFY_APP_ID}
COGNITO_POOL_ID=${COGNITO_POOL_ID}
COGNITO_CLIENT_ID=${COGNITO_CLIENT_ID}
ENV_NAME=${ENV_NAME}
VERSION=${VERSION}
BUILD_NUMBER=${BUILD_NUMBER}
EOL

echo "✅ .env file created for ${ENV_NAME}"
cat .env
