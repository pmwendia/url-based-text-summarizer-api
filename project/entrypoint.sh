#!/bin/sh

# Wait for PostgreSQL to be available
until nc -z -v -w30 web-db 5432
do
  echo "Waiting for database connection..."
  sleep 1
done
echo "PostgreSQL started"
echo "Database is up and running"

# Start the application
exec "$@"

