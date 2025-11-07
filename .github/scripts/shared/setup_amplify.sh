#!/usr/bin/env bash
set -e

# Read from environment variables, with defaults
CREATE_BRANCH=${CREATE_BRANCH:-true}  # Default to true, set to "false" for desktop

# Validate required environment variables
if [ -z "$AMPLIFY_APP_ID" ] || [ -z "$ENV_NAME" ] || [ -z "$PROJECT_NAME" ]; then
  echo "❌ Error: AMPLIFY_APP_ID, ENV_NAME, and PROJECT_NAME environment variables are required"
  exit 1
fi

echo "📦 Setting up AWS credentials for Amplify CLI"

# Create AWS credentials file with session token support
# This is required because amplify pull doesn't properly handle AWS_SESSION_TOKEN
# from environment variables (see: https://github.com/aws-amplify/amplify-cli/issues/11009)
mkdir -p ~/.aws

cat > ~/.aws/credentials << EOF
[default]
aws_access_key_id=${AWS_ACCESS_KEY_ID}
aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}
aws_session_token=${AWS_SESSION_TOKEN}
EOF

cat > ~/.aws/config << EOF
[default]
region=${AWS_REGION}
output=json
EOF

echo "✅ AWS credentials file created"

echo "📦 Pulling Amplify Backend Configuration"
echo "   App ID: $AMPLIFY_APP_ID"
echo "   Environment: $ENV_NAME"
echo "   Project Name: $PROJECT_NAME"

# Pull Amplify backend configuration in headless mode
# Using useProfile=true to read from ~/.aws/credentials (which includes session token)
amplify pull \
  --appId $AMPLIFY_APP_ID \
  --envName $ENV_NAME \
  --yes \
  --amplify '{"projectName":"'$PROJECT_NAME'","envName":"'$ENV_NAME'","defaultEditor":"code"}' \
  --frontend '{"frontend":"flutter","config":{"ResDir":"lib/"}}' \
  --providers '{"awscloudformation":{"configLevel":"project","useProfile":true,"profileName":"default"}}'

echo "✅ Amplify backend configuration pulled successfully"

# Create Amplify branch for hosting (web only)
if [ "$CREATE_BRANCH" = "true" ]; then
  echo ""
  echo "🌿 Creating Amplify Hosting Branch (if not existing)"
  echo "   Checking if branch $ENV_NAME exists..."

  if ! aws amplify get-branch --app-id $AMPLIFY_APP_ID --branch-name $ENV_NAME 2>/dev/null; then
    echo "   Branch $ENV_NAME does not exist. Creating..."
    aws amplify create-branch \
      --app-id $AMPLIFY_APP_ID \
      --branch-name $ENV_NAME \
      --region $AWS_REGION
    echo "   ✅ Branch $ENV_NAME created successfully"
  else
    echo "   ✅ Branch $ENV_NAME already exists"
  fi
else
  echo ""
  echo "📝 Skipping Amplify hosting branch creation (desktop mode)"
fi

echo ""
echo "✅ Amplify setup complete"
