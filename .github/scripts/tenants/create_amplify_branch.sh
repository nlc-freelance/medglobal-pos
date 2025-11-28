#!/usr/bin/env bash
set -e

# Default to "prod" for tenants. For testing, use dev
BRANCH_NAME=${BRANCH_NAME:-dev}

# Validate required environment variables
if [ -z "$AMPLIFY_APP_ID" ] || [ -z "$AWS_REGION" ]; then
  echo "❌ Error: AMPLIFY_APP_ID and AWS_REGION environment variables are required"
  exit 1
fi

echo "🌿 Creating Amplify branch for hosting"
echo "   App ID: $AMPLIFY_APP_ID"
echo "   Branch: $BRANCH_NAME"
echo "   Region: $AWS_REGION"

# Check if branch already exists
if aws amplify get-branch --app-id $AMPLIFY_APP_ID --branch-name $BRANCH_NAME --region $AWS_REGION 2>/dev/null; then
  echo "   ✅ Branch $BRANCH_NAME already exists"
  exit 0
fi

# Create the branch
echo "   Creating branch..."
aws amplify create-branch \
  --app-id $AMPLIFY_APP_ID \
  --branch-name $BRANCH_NAME \
  --region $AWS_REGION \
  --enable-auto-build

echo ""
echo "✅ Branch $BRANCH_NAME created successfully"
