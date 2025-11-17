#!/bin/bash
set -e

# Validate required environment variable
if [ -z "$ENV_NAME" ]; then
  echo "❌ Error: ENV_NAME environment variable is required"
  exit 1
fi

echo "💻️ Building Flutter Web for $ENV_NAME"

flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build web --release --no-tree-shake-icons --dart-define=ENV=$ENV_NAME

# Post-process build to ensure fonts are included
bash .github/scripts/portal_web/post_build_web.sh
