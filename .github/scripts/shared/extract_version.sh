#!/bin/bash
set -e

# Extract VERSION and BUILD_NUMBER from pubspec.yaml
# This makes them available as environment variables for build scripts

echo "📦 Extracting version information from pubspec.yaml..."

# Read version line (format: "version: 2.0.0+23")
VERSION_LINE=$(grep '^version:' pubspec.yaml)

# Extract VERSION (the part before +)
VERSION=$(echo "$VERSION_LINE" | cut -d '+' -f 1 | awk '{print $2}')

# Extract BUILD_NUMBER (the part after +)
BUILD_NUMBER=$(echo "$VERSION_LINE" | cut -d '+' -f 2)

# Validate extraction
if [ -z "$VERSION" ] || [ -z "$BUILD_NUMBER" ]; then
  echo "❌ Error: Failed to extract version information"
  echo "   VERSION_LINE: $VERSION_LINE"
  exit 1
fi

# Export to GitHub environment for subsequent steps
echo "VERSION=$VERSION" >> $GITHUB_ENV
echo "BUILD_NUMBER=$BUILD_NUMBER" >> $GITHUB_ENV

echo "✅ Extracted version information:"
echo "   VERSION=$VERSION"
echo "   BUILD_NUMBER=$BUILD_NUMBER"
