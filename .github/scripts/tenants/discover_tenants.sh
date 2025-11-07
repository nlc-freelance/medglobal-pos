#!/usr/bin/env bash
set -e

REPO=$1  # Format: owner/repo
TENANT_INPUT=$2  # Either "all" or comma-separated list

echo "🔍 Discovering tenant environments..."

# Get all environments from GitHub
ALL_ENVIRONMENTS=$(gh api repos/$REPO/environments --jq '.environments[].name')

# Filter only tenant-* environments
TENANT_ENVIRONMENTS=$(echo "$ALL_ENVIRONMENTS" | grep '^tenant-' || true)

if [ -z "$TENANT_ENVIRONMENTS" ]; then
  echo "❌ No tenant environments found matching pattern 'tenant-*'"
  echo "   Available environments:"
  echo "$ALL_ENVIRONMENTS" | sed 's/^/   - /'
  exit 1
fi

echo "✅ Found tenant environments:"
echo "$TENANT_ENVIRONMENTS" | sed 's/^/   - /'
echo ""

# Process tenant selection
if [ "$TENANT_INPUT" = "all" ]; then
  SELECTED_TENANTS="$TENANT_ENVIRONMENTS"
  echo "📋 Processing all tenants"
else
  # Parse comma-separated list and validate
  IFS=',' read -ra TENANT_ARRAY <<< "$TENANT_INPUT"
  SELECTED_TENANTS=""

  for tenant in "${TENANT_ARRAY[@]}"; do
    # Trim whitespace
    tenant=$(echo "$tenant" | xargs)

    # Check if tenant exists
    if echo "$TENANT_ENVIRONMENTS" | grep -q "^tenant-$tenant$"; then
      SELECTED_TENANTS="$SELECTED_TENANTS
tenant-$tenant"
    else
      echo "⚠️  Warning: tenant-$tenant not found, skipping..."
    fi
  done

  if [ -z "$SELECTED_TENANTS" ]; then
    echo "❌ None of the specified tenants were found"
    exit 1
  fi

  echo "📋 Processing selected tenants:"
  echo "$SELECTED_TENANTS" | grep -v '^$' | sed 's/^/   - /'
fi

# Output for GitHub Actions (JSON array)
TENANT_JSON=$(echo "$SELECTED_TENANTS" | grep -v '^$' | jq -R -s -c 'split("\n") | map(select(length > 0))')
echo "tenants=$TENANT_JSON" >> $GITHUB_OUTPUT

echo ""
echo "✅ Tenant discovery complete"
