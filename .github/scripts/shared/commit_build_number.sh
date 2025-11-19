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

echo "💾 Checking if version bump should be committed for $ENV_NAME"

# Skip commit for production environments
if [ "$ENV_NAME" = "prod" ]; then
  echo "⏭️  Skipping version bump commit for production environment"
  exit 0
fi

# Check if pubspec.yaml has changes
if ! git diff --quiet pubspec.yaml; then
  VERSION_LINE=$(grep '^version:' pubspec.yaml)
  VERSION=$(echo "$VERSION_LINE" | cut -d '+' -f 1 | awk '{print $2}')
  BUILD=$(echo "$VERSION_LINE" | cut -d '+' -f 2)

  echo "📝 Committing version bump to ${VERSION}+${BUILD}"

  # Configure git user
  git config user.name "github-actions[bot]"
  git config user.email "github-actions[bot]@users.noreply.github.com"

  # Configure git to use token for authentication
  git config --global url."https://${GH_TOKEN}@github.com/".insteadOf "https://github.com/"

  git add pubspec.yaml
  git commit -m "🔢 Bump build number to ${BUILD} for ${ENV_NAME}"

  if git push; then
    echo "✅ Version bump committed and pushed successfully"
  else
    echo "⚠️  Failed to push version bump (may have conflicts)"
    exit 0  # Don't fail the workflow
  fi
else
  echo "ℹ️  No version changes to commit"
fi
