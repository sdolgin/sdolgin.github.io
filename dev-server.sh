#!/bin/bash
# Development server script that loads local configuration
# Usage: ./dev-server.sh

# Check if local config exists
if [ -f _config.local.yml ]; then
    echo "Using local configuration from _config.local.yml..."
    CONFIG_FILES="_config.yml,_config.local.yml"
else
    echo "Warning: _config.local.yml not found. Create it with your Application Insights configuration."
    echo "See APPLICATION_INSIGHTS_README.md for details."
    CONFIG_FILES="_config.yml"
fi

# Start Jekyll server
echo "Starting Jekyll development server..."
bundle exec jekyll serve --host 0.0.0.0 --port 4002 --livereload --config $CONFIG_FILES
