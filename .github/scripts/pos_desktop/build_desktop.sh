#!/bin/bash
set -e

# Validate required environment variables
if [ -z "$ENV_NAME" ] || [ -z "$BASE_URL" ]; then
  echo "❌ Error: Required environment variables are not set"
  echo "   Required: ENV_NAME, BASE_URL"
  exit 1
fi

echo "🖥️ Building Flutter Windows Desktop for $ENV_NAME"

# Fix SQLite encryption conflict
# This resolves the conflict between amplify_db_common and sqlcipher_flutter_libs
# Both packages define a sqlite3 CMake target, causing build failures
echo "🔧 Applying fix for SQLite encryption conflict..."
bash windows/fix_sqlite_conflict.sh --verbose

flutter build windows --release \
  --dart-define=BASE_URL=$BASE_URL \
  --dart-define=ENV_NAME=$ENV_NAME

echo "✅ Windows build completed successfully"
echo "📁 Build output: build/windows/x64/runner/Release/"
