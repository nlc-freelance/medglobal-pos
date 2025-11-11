#!/bin/bash
set -e

# Read from environment variables, fallback to 0 if not set
GITHUB_RUN_NUMBER=${GITHUB_RUN_NUMBER:-0}

# Validate required environment variable
if [ -z "$ENV_NAME" ]; then
  echo "❌ Error: ENV_NAME environment variable is required"
  exit 1
fi

echo "🔢 Build number management for $ENV_NAME (run: $GITHUB_RUN_NUMBER)"

# Skip bumping for production environments
if [ "$ENV_NAME" = "prod" ]; then
  echo "⏭️  Skipping build number bump for production environment"
  echo "ℹ️  Production builds use stable version numbers"
  exit 0
fi

# Only bump for dev and preprod environments
if [ "$ENV_NAME" != "dev" ] && [ "$ENV_NAME" != "preprod" ]; then
  echo "⚠️  Unknown environment: $ENV_NAME (expected: dev, preprod, or prod)"
  echo "⏭️  Skipping build number bump"
  exit 0
fi

# Read current version
VERSION_LINE=$(grep '^version:' pubspec.yaml)
VERSION=$(echo "$VERSION_LINE" | cut -d '+' -f 1 | awk '{print $2}')
CURRENT_BUILD=$(echo "$VERSION_LINE" | cut -d '+' -f 2)

if [ -z "$CURRENT_BUILD" ]; then
  CURRENT_BUILD=0
fi

# Use GitHub run number if provided, otherwise auto-increment
if [ "$GITHUB_RUN_NUMBER" -gt 0 ]; then
  NEW_BUILD=$GITHUB_RUN_NUMBER
  echo "📊 Using GitHub run number: $NEW_BUILD"
else
  NEW_BUILD=$((CURRENT_BUILD + 1))
  echo "📊 Auto-incrementing: $CURRENT_BUILD → $NEW_BUILD"
fi

NEW_VERSION_LINE="version: ${VERSION}+${NEW_BUILD}"

# Update pubspec.yaml (locally only - commit happens after successful deployment)
sed -i "s/^version:.*/$NEW_VERSION_LINE/" pubspec.yaml
echo "✅ Updated version to: $NEW_VERSION_LINE (local only)"
echo ""
echo "ℹ️ Version bump will be committed after successful deployment"
