#!/usr/bin/env bash
set -e

if [ -z "$GH_TOKEN" ]; then
  echo "❌ Error: GH_TOKEN environment variable is not set"
  echo "   Please provide it as an environment variable"
  exit 1
fi

echo "⚙️ Configuring Git to use GitHub Personal Access Token for private dependencies"

git config --global url."https://${GH_TOKEN}@github.com/".insteadOf "https://github.com/"

echo "✅ Configured Git to use GitHub PAT successfully"
