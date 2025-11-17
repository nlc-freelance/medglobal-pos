#!/bin/bash
set -e

# Validate required environment variable
if [ -z "$ENV_NAME" ]; then
  echo "❌ Error: ENV_NAME environment variable is required"
  exit 1
fi

echo "🖥️ Building Flutter Windows Desktop for $ENV_NAME"

flutter clean
flutter pub get

# Fix SQLite encryption conflict
# This resolves the conflict between amplify_db_common and sqlcipher_flutter_libs
# Both packages define a sqlite3 CMake target, causing build failures
echo "🔧 Applying fix for SQLite encryption conflict..."
bash windows/fix_sqlite_conflict.sh --verbose

dart run build_runner build --delete-conflicting-outputs
flutter build windows --release --dart-define=ENV=$ENV_NAME

echo "✅ Windows build completed successfully"
echo "📁 Build output: build/windows/x64/runner/Release/"
