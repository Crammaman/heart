#!/bin/bash
#set -e

git clone -b main --single-branch https://github.com/Crammaman/heart.git . || git pull

bundle

rails db:create
rails db:migrate

yarn
yarn build

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"