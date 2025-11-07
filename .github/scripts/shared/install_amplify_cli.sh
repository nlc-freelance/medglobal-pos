#!/usr/bin/env bash
set -e

echo "⚙️ Installing Amplify CLI"
npm install -g @aws-amplify/cli
echo "✅ Amplify CLI installed successfully"
amplify --version