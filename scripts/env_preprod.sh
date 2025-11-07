#!/bin/bash
# scripts/env_dev.sh

echo "🧩 Generating PREPROD environment..."

cat > .env <<EOL
BASE_URL=https://w9u9b44xu9.execute-api.ap-southeast-1.amazonaws.com/preprod
ENV_NAME=preprod
EOL

echo "✅  Created .env for PREPROD"