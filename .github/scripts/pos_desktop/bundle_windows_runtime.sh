#!/bin/bash
set -e

echo "📦 Bundling Windows runtime dependencies..."

# Paths
RELEASE_DIR="build/windows/x64/runner/Release"
STAGING_DIR="build/windows_installer_staging"
REPO_DLL_DIR="windows/installer/runtime_dlls"

# Create staging directory
echo "📁 Creating staging directory..."
rm -rf "$STAGING_DIR"
mkdir -p "$STAGING_DIR"

# Copy all files from Release directory
echo "📋 Copying application files from Release build..."
if [ ! -d "$RELEASE_DIR" ]; then
  echo "❌ ERROR: Release build directory not found at $RELEASE_DIR"
  echo "   Did you run 'flutter build windows --release'?"
  exit 1
fi

cp -r "$RELEASE_DIR"/* "$STAGING_DIR"/

# Bundle VC++ Runtime DLLs
echo "🔧 Bundling VC++ Runtime DLLs..."

# Required runtime DLLs
REQUIRED_DLLS=(
  "msvcp140.dll"
  "msvcp140_1.dll"
  "msvcp140_2.dll"
  "vcruntime140.dll"
  "vcruntime140_1.dll"
)

# Try to copy from repository first (user-provided DLLs)
if [ -d "$REPO_DLL_DIR" ] && [ "$(ls -A $REPO_DLL_DIR/*.dll 2>/dev/null)" ]; then
  echo "✅ Using VC++ runtime DLLs from repository ($REPO_DLL_DIR)"
  cp "$REPO_DLL_DIR"/*.dll "$STAGING_DIR"/
else
  echo "⚠️  Repository DLLs not found, searching GitHub Actions runner..."

  # Fallback: Search for DLLs on GitHub runner
  # Path on GitHub Actions: C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Redist\MSVC\{version}\x64\Microsoft.VC143.CRT\
  VS_REDIST_BASE="/c/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Redist/MSVC"

  if [ -d "$VS_REDIST_BASE" ]; then
    # Find the latest MSVC version directory
    MSVC_VERSION=$(ls -v "$VS_REDIST_BASE" 2>/dev/null | tail -1)

    if [ -n "$MSVC_VERSION" ]; then
      DLL_PATH="$VS_REDIST_BASE/$MSVC_VERSION/x64/Microsoft.VC143.CRT"

      if [ -d "$DLL_PATH" ]; then
        echo "📂 Found VC++ redistributable at: $DLL_PATH"
        echo "📂 Copying all DLLs from redistributable package..."
        cp "$DLL_PATH"/*.dll "$STAGING_DIR"/ 2>/dev/null || true
      else
        echo "❌ ERROR: VC143.CRT directory not found at $DLL_PATH"
        exit 1
      fi
    else
      echo "❌ ERROR: No MSVC version found in $VS_REDIST_BASE"
      exit 1
    fi
  else
    echo "❌ ERROR: Visual Studio redistributable directory not found"
    echo "   Expected at: $VS_REDIST_BASE"
    echo ""
    echo "💡 Solution: Commit the required DLLs to $REPO_DLL_DIR/"
    exit 1
  fi
fi

# Verify all required DLLs are present
echo "✔️  Verifying required DLLs..."
MISSING_DLLS=()

for dll in "${REQUIRED_DLLS[@]}"; do
  if [ ! -f "$STAGING_DIR/$dll" ]; then
    MISSING_DLLS+=("$dll")
  fi
done

if [ ${#MISSING_DLLS[@]} -gt 0 ]; then
  echo "❌ ERROR: Missing required DLL(s):"
  for dll in "${MISSING_DLLS[@]}"; do
    echo "   - $dll"
  done
  echo ""
  echo "💡 Solution: Ensure these DLLs are in $REPO_DLL_DIR/ or available on the runner"
  exit 1
fi

# List all DLLs found in staging
echo ""
echo "📦 All DLLs bundled in staging directory:"
ls -1 "$STAGING_DIR"/*.dll | while read dll; do
  echo "   ✓ $(basename "$dll")"
done

echo ""
echo "✅ Runtime dependencies bundled successfully!"
echo "📁 Staging directory: $STAGING_DIR"
