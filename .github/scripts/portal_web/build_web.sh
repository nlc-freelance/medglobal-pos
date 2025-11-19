#!/bin/bash
set -e

# Validate required environment variables
if [ -z "$ENV_NAME" ] || [ -z "$BASE_URL" ]; then
  echo "❌ Error: Required environment variables are not set"
  echo "   Required: ENV_NAME, BASE_URL"
  exit 1
fi

echo "💻️ Building Flutter Web for $ENV_NAME"

flutter build web --release --no-tree-shake-icons \
  --dart-define=BASE_URL=$BASE_URL \
  --dart-define=ENV_NAME=$ENV_NAME

# Post-process build to ensure fonts are included
bash .github/scripts/portal_web/post_build_web.sh
