#!/bin/bash
# scripts/env_dev.sh

echo "🧩 Generating DEV environment..."

cat > .env <<EOL
BASE_URL=https://awimrjguq7.execute-api.ap-southeast-1.amazonaws.com/dev
ENV_NAME=dev
EOL

echo "✅  Created .env for DEV"