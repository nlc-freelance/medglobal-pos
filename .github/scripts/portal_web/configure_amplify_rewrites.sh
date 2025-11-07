#!/usr/bin/env bash
set -e

# Read from environment variables
if [ -z "$AMPLIFY_APP_ID" ] || [ -z "$AWS_REGION" ]; then
  echo "❌ Error: AMPLIFY_APP_ID and AWS_REGION environment variables are required"
  exit 1
fi

echo "🔀 Configuring SPA rewrites and redirects"
echo "   App ID: $AMPLIFY_APP_ID"

# SPA rewrite configuration for Flutter web
# This ensures all routes are handled by index.html (client-side routing)
CUSTOM_RULES='[
  {
    "source": "</^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|woff2|ttf|map|json|webp)$)([^.]+$)/>",
    "status": "200",
    "target": "/index.html"
  }
]'

echo "   Applying rewrite rules..."
aws amplify update-app \
  --app-id $AMPLIFY_APP_ID \
  --region $AWS_REGION \
  --custom-rules "$CUSTOM_RULES"

echo ""
echo "✅ SPA rewrites configured successfully"
echo "   Rule: All non-static files → /index.html (200)"
