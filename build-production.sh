#!/bin/bash
# Production build script
# Usage: ./build-production.sh

# Check if production config exists or create it from environment variables
if [ ! -f _config.production.yml ]; then
    if [ -z "$APPINSIGHTS_CONNECTION_STRING" ]; then
        echo "Error: _config.production.yml not found and APPINSIGHTS_CONNECTION_STRING environment variable is not set"
        echo "Either create _config.production.yml or set environment variables"
        exit 1
    fi

    echo "Creating production config from environment variables..."
    cat > _config.production.yml << EOF
application_insights:
  connection_string: "$APPINSIGHTS_CONNECTION_STRING"
  instrumentation_key: "$APPINSIGHTS_INSTRUMENTATION_KEY"
  workspace: "$APPINSIGHTS_WORKSPACE"
EOF
fi

echo "Building Jekyll site for production..."

# Build the site with production environment
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config.production.yml

echo "Production build complete!"
echo "Site files are in _site/ directory"
