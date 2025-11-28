#!/bin/bash
set -e

# Validate required environment variables
if [ -z "$ENV_NAME" ]; then
  echo "❌ Error: ENV_NAME environment variable is required"
  exit 1
fi

if [ -z "$TENANT_NAME" ]; then
  echo "❌ Error: TENANT_NAME environment variable is required"
  exit 1
fi

echo "🚀 Creating GitHub release for $TENANT_NAME tenant..."

# ──────────────────────────────────────────────────────────────
# Extract version information from pubspec.yaml
# ──────────────────────────────────────────────────────────────
VERSION_LINE=$(grep '^version:' pubspec.yaml)
APP_VERSION=$(echo "$VERSION_LINE" | cut -d '+' -f 1 | awk '{print $2}')
APP_BUILD=$(echo "$VERSION_LINE" | cut -d '+' -f 2)

if [ -z "$APP_VERSION" ] || [ -z "$APP_BUILD" ]; then
  echo "❌ ERROR: Could not extract version from pubspec.yaml"
  exit 1
fi

echo "📋 Version: $APP_VERSION"
echo "📋 Build: $APP_BUILD"
echo "📋 Environment: $ENV_NAME"
echo "📋 Tenant: $TENANT_NAME"

APP_NAME="${INSTALLER_APP_NAME}"

# ──────────────────────────────────────────────────────────────
# Define release tag and name
# Production: Simplified tag (pos-desktop-v2.0.0)
# Internal (dev/preprod): Include tenant and build (pos-desktop-v2.0.0-dev+43)
# Tenant deployments: Include tenant only (pos-desktop-v2.0.0-beta)
# ──────────────────────────────────────────────────────────────
if [ "$ENV_NAME" == "main" ]; then
  RELEASE_TAG="pos-desktop-v${APP_VERSION}"
  RELEASE_NAME="${APP_NAME} Desktop v${APP_VERSION}"
elif [[ "$TENANT_NAME" =~ ^(dev|preprod)$ ]]; then
  # Internal environments: Include build number
  RELEASE_TAG="pos-desktop-v${APP_VERSION}-${TENANT_NAME}+${APP_BUILD}"
  RELEASE_NAME="${APP_NAME} Desktop v${APP_VERSION}-${TENANT_NAME}+${APP_BUILD}"
else
  # Tenant deployments: No build number
  RELEASE_TAG="pos-desktop-v${APP_VERSION}-${TENANT_NAME}"
  RELEASE_NAME="${APP_NAME} Desktop v${APP_VERSION}-${TENANT_NAME}"
fi

echo "🏷️  Release Tag: $RELEASE_TAG"
echo "📝 Release Name: $RELEASE_NAME"

# ──────────────────────────────────────────────────────────────
# Check if installer exists (must match create_installer.sh logic)
# ──────────────────────────────────────────────────────────────
if [ "$ENV_NAME" == "main" ]; then
  # Production: No tenant name, no build number
  INSTALLER_NAME="${APP_NAME}-v${APP_VERSION}.exe"
elif [[ "$TENANT_NAME" =~ ^(dev|preprod)$ ]]; then
  # Internal environments: Include build number
  INSTALLER_NAME="${APP_NAME}-v${APP_VERSION}-${TENANT_NAME}+${APP_BUILD}.exe"
else
  # Tenant deployments: No build number
  INSTALLER_NAME="${APP_NAME}-v${APP_VERSION}-${TENANT_NAME}.exe"
fi
INSTALLER_PATH="windows/installer/Output/$INSTALLER_NAME"

if [ ! -f "$INSTALLER_PATH" ]; then
  echo "❌ ERROR: Installer not found at $INSTALLER_PATH"
  echo "   Did you run create_installer.sh?"
  exit 1
fi

INSTALLER_SIZE=$(du -h "$INSTALLER_PATH" | cut -f1)
echo "📦 Installer: $INSTALLER_NAME ($INSTALLER_SIZE)"

# ──────────────────────────────────────────────────────────────
# Determine release type (pre-release for dev)
# ──────────────────────────────────────────────────────────────
PRERELEASE_FLAG=""
if [ "$ENV" = "dev" ]; then
  PRERELEASE_FLAG="--prerelease"
  echo "⚠️  Marking as pre-release (dev environment)"
fi

# ──────────────────────────────────────────────────────────────
# Check if release already exists
# ──────────────────────────────────────────────────────────────
if gh release view "$RELEASE_TAG" >/dev/null 2>&1; then
  echo "⚠️  Release $RELEASE_TAG already exists"
  echo "🗑️  Deleting existing release..."
  gh release delete "$RELEASE_TAG" --yes --cleanup-tag
fi

# ──────────────────────────────────────────────────────────────
# Create release notes
# ──────────────────────────────────────────────────────────────
RELEASE_NOTES=$(cat <<EOF
## ${APP_NAME} Desktop - Windows Installer

**Version:** ${APP_VERSION}
**Build:** ${APP_BUILD}
**Environment:** ${ENV}
**Platform:** Windows x64

### 📥 Download

Download \`${INSTALLER_NAME}\` below and run it to install ${APP_NAME} on your Windows computer.

### 📋 Installation Requirements

- **OS:** Windows 10 (64-bit) or later
- **RAM:** 4GB minimum, 8GB recommended
- **Disk Space:** 200MB available space
- **Administrator Rights:** Required for installation

### ⚠️ Security Notice

This installer is not digitally signed. Windows may show a SmartScreen warning:
1. Click "More info"
2. Click "Run anyway"

### 🔧 What's Included

- ${APP_NAME} Desktop Application
- Visual C++ Runtime Libraries (bundled)
- All required Flutter engine components
- Offline-first database for POS operations

### 📝 Change Log

EOF
)

# Auto-generate release notes (requires GITHUB_TOKEN)
echo "📝 Generating release notes..."
AUTO_NOTES=$(gh api repos/:owner/:repo/releases/generate-notes \
  -F tag_name="$RELEASE_TAG" \
  -F target_commitish="$ENV" \
  --jq '.body' 2>/dev/null || echo "No automatic release notes available")

FULL_RELEASE_NOTES=$(cat <<EOF
$RELEASE_NOTES

$AUTO_NOTES

---

🤖 *This release was automatically generated by GitHub Actions*
EOF
)

# ──────────────────────────────────────────────────────────────
# Create GitHub release
# ──────────────────────────────────────────────────────────────
echo "🚀 Creating GitHub release..."

gh release create "$RELEASE_TAG" \
  "$INSTALLER_PATH" \
  --title "$RELEASE_NAME" \
  --notes "$FULL_RELEASE_NOTES" \
  --target "$ENV" \
  $PRERELEASE_FLAG

# ──────────────────────────────────────────────────────────────
# Get release URL
# ──────────────────────────────────────────────────────────────
RELEASE_URL=$(gh release view "$RELEASE_TAG" --json url --jq '.url')

# Export release URL for GitHub Actions to capture
echo "release_url=$RELEASE_URL" >> $GITHUB_OUTPUT

echo ""
echo "✅ Release created successfully!"
echo "🔗 Release URL: $RELEASE_URL"
echo "📦 Installer: $INSTALLER_NAME"
echo ""
echo "🎉 Deployment complete!"
