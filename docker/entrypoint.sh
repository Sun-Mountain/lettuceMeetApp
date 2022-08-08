#!/usr/bin/env sh

set -e

# Clean the existing pid if the server was previously started
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Run database migrations
echo "Migrating database..."
bundle exec rails db:migrate

# Start the database service
bundle exec rails server -b 0.0.0.0 -p 3000
