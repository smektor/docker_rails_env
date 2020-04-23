#!/bin/bash
set -e
# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid
# Check for new gems if there are install them
bundle check || bundle install
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
