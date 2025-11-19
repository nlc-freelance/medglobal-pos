#!/bin/bash
set -e

# Validate required environment variable
if [ -z "$ENV_NAME" ]; then
  echo "❌ Error: ENV_NAME environment variable is required"
  exit 1
fi

echo "📦 Creating Windows installer for $ENV_NAME environment..."

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

# ──────────────────────────────────────────────────────────────
# Get app metadata from environment variables
# ──────────────────────────────────────────────────────────────

# Required variables
APP_PUBLISHER="${INSTALLER_PUBLISHER}"
APP_NAME="${INSTALLER_APP_NAME}"

# Optional variables (default to empty string if not set)
SUPPORT_URL="${INSTALLER_SUPPORT_URL:-}"

# ──────────────────────────────────────────────────────────────
# Validate required variables
# ──────────────────────────────────────────────────────────────
if [ -z "$APP_PUBLISHER" ]; then
  echo "❌ ERROR: INSTALLER_PUBLISHER environment variable is required"
  echo "   Please configure it in GitHub Environment Settings"
  echo "   Example: INSTALLER_PUBLISHER=ABC, Inc."
  exit 1
fi

if [ -z "$APP_NAME" ]; then
  echo "❌ ERROR: INSTALLER_APP_NAME environment variable is required"
  echo "   Please configure it in GitHub Environment Settings"
  echo "   Example: INSTALLER_APP_NAME=MyPOS"
  exit 1
fi

# ──────────────────────────────────────────────────────────────
# Display configuration
# ──────────────────────────────────────────────────────────────
echo "📋 Publisher: $APP_PUBLISHER"
echo "📋 App Name: $APP_NAME"
if [ -n "$SUPPORT_URL" ]; then
  echo "📋 Support URL: $SUPPORT_URL"
fi

# ──────────────────────────────────────────────────────────────
# Prepare InnoSetup script by replacing placeholders
# ──────────────────────────────────────────────────────────────
TEMPLATE_FILE="windows/installer/setup.iss"
COMPILED_FILE="windows/installer/setup_compiled.iss"

echo "🔧 Preparing InnoSetup script..."

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "❌ ERROR: InnoSetup template not found at $TEMPLATE_FILE"
  exit 1
fi

# Replace placeholders in template
# For production (main): Replace TENANT_NAME with empty string, then clean up
# For non-prod: Replace TENANT_NAME with actual tenant name value
if [ "$ENV_NAME" == "main" ]; then
  # Production: Replace TENANT_NAME with empty, then remove resulting empty patterns
  sed -e "s|{{APP_VERSION}}|$APP_VERSION|g" \
      -e "s|{{APP_BUILD}}|$APP_BUILD|g" \
      -e "s|{{TENANT_NAME}}||g" \
      -e "s|--||g" \
      -e "s|-+|+|g" \
      -e "s|{{APP_PUBLISHER}}|$APP_PUBLISHER|g" \
      -e "s|{{APP_NAME}}|$APP_NAME|g" \
      -e "s|{{SUPPORT_URL}}|$SUPPORT_URL|g" \
      "$TEMPLATE_FILE" > "$COMPILED_FILE"
else
  # Non-production: Replace TENANT_NAME with actual value
  sed -e "s|{{APP_VERSION}}|$APP_VERSION|g" \
      -e "s|{{APP_BUILD}}|$APP_BUILD|g" \
      -e "s|{{TENANT_NAME}}|$TENANT_NAME|g" \
      -e "s|{{APP_PUBLISHER}}|$APP_PUBLISHER|g" \
      -e "s|{{APP_NAME}}|$APP_NAME|g" \
      -e "s|{{SUPPORT_URL}}|$SUPPORT_URL|g" \
      "$TEMPLATE_FILE" > "$COMPILED_FILE"
fi

echo "✅ InnoSetup script prepared: $COMPILED_FILE"

# ──────────────────────────────────────────────────────────────
# Compile installer with InnoSetup
# ──────────────────────────────────────────────────────────────
echo "🔨 Compiling installer with InnoSetup..."

# InnoSetup compiler path on GitHub Actions Windows runner
ISCC_PATH="/c/Program Files (x86)/Inno Setup 6/ISCC.exe"

if [ ! -f "$ISCC_PATH" ]; then
  echo "❌ ERROR: InnoSetup compiler not found at $ISCC_PATH"
  echo "   Make sure InnoSetup is installed via chocolatey"
  exit 1
fi

# Compile the installer
"$ISCC_PATH" "$COMPILED_FILE"

# ──────────────────────────────────────────────────────────────
# Verify installer was created
# ──────────────────────────────────────────────────────────────
if [ "$ENV_NAME" == "main" ]; then
  # Production: No tenant name, no build number
  INSTALLER_NAME="${APP_NAME}-v${APP_VERSION}.exe"
elif [[ "$TENANT_NAME" =~ ^(dev|staging|preprod)$ ]]; then
  # Internal environments: Include build number
  INSTALLER_NAME="${APP_NAME}-v${APP_VERSION}-${TENANT_NAME}+${APP_BUILD}.exe"
else
  # Tenant deployments: No build number
  INSTALLER_NAME="${APP_NAME}-v${APP_VERSION}-${TENANT_NAME}.exe"
fi
INSTALLER_PATH="windows/installer/Output/$INSTALLER_NAME"

if [ ! -f "$INSTALLER_PATH" ]; then
  echo "❌ ERROR: Installer was not created at $INSTALLER_PATH"
  exit 1
fi

# Get installer size
INSTALLER_SIZE=$(du -h "$INSTALLER_PATH" | cut -f1)

echo ""
echo "✅ Installer created successfully!"
echo "📦 File: $INSTALLER_NAME"
echo "📊 Size: $INSTALLER_SIZE"
echo "📁 Path: $INSTALLER_PATH"

# Clean up compiled script
rm -f "$COMPILED_FILE"
