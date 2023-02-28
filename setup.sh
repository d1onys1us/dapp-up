#!/bin/bash

set -e

# Run forge install
echo "Installing forge dependencies..."
forge install

echo "Installing node dependencies with pnpm..."
pnpm install

# Copy .env.template files for foundry
if [ ! -f .env ]; then
    echo "Copying .env.template to .env... (foundry)"
    cp .env.template .env
fi

# Copy .env.template files for app
if [ ! -f packages/app/.env ]; then
    echo "Copying packages/app/.env.template to packages/app/.env... (app)"
    cp packages/app/.env.template packages/app/.env
fi

echo "Done!"