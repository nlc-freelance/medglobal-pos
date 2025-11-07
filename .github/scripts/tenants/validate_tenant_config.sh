#!/usr/bin/env bash
set -e

TENANT_ENV=$1  # e.g., tenant-hospital-a
VALIDATION_MODE=${2:-"full"}  # "onboarding" or "full" (default: full)

echo "🔍 Validating configuration for $TENANT_ENV (mode: $VALIDATION_MODE)..."

# ─────────────────────────────────────────────────────────────
# REPOSITORY-LEVEL SECRETS (shared across all tenants)
# ─────────────────────────────────────────────────────────────
REPO_SECRETS=(
  "GH_TOKEN"
  # AWS credentials no longer needed - using OIDC authentication
)

# ─────────────────────────────────────────────────────────────
# REPOSITORY-LEVEL VARIABLES (shared across all tenants)
# ─────────────────────────────────────────────────────────────
REPO_VARS=(
  "AWS_REGION"
  "INSTALLER_PUBLISHER"
  "INSTALLER_APP_NAME"
)

# ─────────────────────────────────────────────────────────────
# TENANT-SPECIFIC SECRETS (per environment)
# ─────────────────────────────────────────────────────────────
TENANT_SECRETS=(
  "COGNITO_POOL_ID"
  "COGNITO_CLIENT_ID"
)

# AMPLIFY_APP_ID is only required for deployments, not during onboarding
# (it gets created during the onboarding process)
if [ "$VALIDATION_MODE" != "onboarding" ]; then
  TENANT_SECRETS+=("AMPLIFY_APP_ID")
fi

# ─────────────────────────────────────────────────────────────
# TENANT-SPECIFIC VARIABLES (per environment)
# ─────────────────────────────────────────────────────────────
TENANT_VARS=(
  "BASE_URL"
  "TENANT_NAME"
)

VALIDATION_FAILED=false

# Check repository-level secrets
echo "   Checking repository-level secrets..."
for secret in "${REPO_SECRETS[@]}"; do
  if [ -z "${!secret}" ]; then
    echo "   ❌ Missing repository secret: $secret"
    echo "      → Set this in: Settings > Secrets and variables > Actions > Repository secrets"
    VALIDATION_FAILED=true
  else
    echo "   ✅ $secret is set"
  fi
done

# Check repository-level variables
echo "   Checking repository-level variables..."
for var in "${REPO_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    echo "   ❌ Missing repository variable: $var"
    echo "      → Set this in: Settings > Secrets and variables > Actions > Repository variables"
    VALIDATION_FAILED=true
  else
    echo "   ✅ $var is set"
  fi
done

# Check tenant-specific secrets
echo "   Checking tenant-specific secrets..."
for secret in "${TENANT_SECRETS[@]}"; do
  if [ -z "${!secret}" ]; then
    echo "   ❌ Missing tenant secret: $secret"
    echo "      → Set this in: Settings > Environments > $TENANT_ENV > Environment secrets"
    VALIDATION_FAILED=true
  else
    echo "   ✅ $secret is set"
  fi
done

# Check tenant-specific variables
echo "   Checking tenant-specific variables..."
for var in "${TENANT_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    echo "   ❌ Missing tenant variable: $var"
    echo "      → Set this in: Settings > Environments > $TENANT_ENV > Environment variables"
    VALIDATION_FAILED=true
  else
    echo "   ✅ $var is set"
  fi
done

if [ "$VALIDATION_FAILED" = true ]; then
  echo ""
  echo "❌ Configuration validation failed for $TENANT_ENV"
  echo ""
  echo "📝 Configuration checklist:"
  echo "   Repository-level (shared): GH_TOKEN, AWS_IAM_ROLE_ARN"
  echo "   Repository-level (shared): AWS_REGION, INSTALLER_PUBLISHER, INSTALLER_APP_NAME"
  if [ "$VALIDATION_MODE" = "onboarding" ]; then
    echo "   Tenant-specific: COGNITO_POOL_ID, COGNITO_CLIENT_ID"
    echo "   Tenant-specific: BASE_URL, TENANT_NAME"
    echo "   (AMPLIFY_APP_ID will be auto-created during onboarding)"
  else
    echo "   Tenant-specific: COGNITO_POOL_ID, COGNITO_CLIENT_ID, AMPLIFY_APP_ID"
    echo "   Tenant-specific: BASE_URL, TENANT_NAME"
  fi
  echo ""
  echo "ℹ️  Note: AWS credentials are obtained via OIDC (no secrets needed)"
  exit 1
fi

echo ""
echo "✅ Configuration validation passed for $TENANT_ENV"
