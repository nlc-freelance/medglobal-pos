#!/bin/bash
set -e

echo "🔧 Post-processing web build..."

# Ensure fonts directory exists in build output
mkdir -p build/web/assets/fonts

# Copy MaterialIcons font if not present
if [ ! -f "build/web/assets/fonts/MaterialIcons-Regular.ttf" ]; then
  echo "📦 Copying MaterialIcons font..."
  cp web/assets/fonts/MaterialIcons-Regular.ttf build/web/assets/fonts/
fi

# Copy or merge FontManifest.json
if [ -f "web/assets/FontManifest.json" ]; then
  echo "📝 Updating FontManifest.json..."
  cp web/assets/FontManifest.json build/web/assets/
fi

# Copy package assets if needed
echo "📦 Checking package assets..."
for package in syncfusion_flutter_core syncfusion_flutter_datagrid country_code_picker; do
  # Search for package assets in .dart_tool
  package_assets=$(find .dart_tool/flutter_build -type d -path "*packages/$package/assets" 2>/dev/null | head -1 || true)

  if [ -n "$package_assets" ] && [ -d "$package_assets" ]; then
    echo "📦 Copying $package assets..."
    mkdir -p "build/web/assets/packages/$package"
    cp -r "$package_assets"/* "build/web/assets/packages/$package/" 2>/dev/null || true
  fi
done

echo "✅ Post-processing complete"
