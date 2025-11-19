#!/bin/bash
set -e

# Validate required environment variables
if [ -z "$ENV_NAME" ]; then
  echo "❌ Error: ENV_NAME environment variable is required"
  exit 1
fi

if [ -z "$GH_TOKEN" ]; then
  echo "❌ Error: GH_TOKEN environment variable is required for pushing"
  exit 1
fi

if [ -z "$GITHUB_RUN_NUMBER" ]; then
  echo "❌ Error: GITHUB_RUN_NUMBER environment variable is required"
  exit 1
fi

echo "💾 Bumping and committing build number"

# Skip commit for production environments
if [ "$ENV_NAME" = "prod" ]; then
  echo "⏭️  Skipping build number commit for production environment"
  exit 0
fi

# Bump the build number
echo "📈 Bumping build number..."
bash .github/scripts/shared/bump_build_number.sh

# Get the new version info
VERSION_LINE=$(grep '^version:' pubspec.yaml)
VERSION=$(echo "$VERSION_LINE" | cut -d '+' -f 1 | awk '{print $2}')
BUILD=$(echo "$VERSION_LINE" | cut -d '+' -f 2)

echo "📝 Committing build number bump to ${VERSION}+${BUILD}"

# Configure git user
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

# Configure git to use token for authentication
git config --global url."https://${GH_TOKEN}@github.com/".insteadOf "https://github.com/"

git add pubspec.yaml
git commit -m "Bump build number to ${BUILD}"

if git push; then
  echo "✅ Build number committed and pushed successfully"
else
  echo "⚠️  Failed to push build number (may have conflicts)"
  exit 0  # Don't fail the workflow
fi
