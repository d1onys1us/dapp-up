#!/bin/bash

# Run forge install
echo "Installing forge dependencies..."
forge install

echo "Installing node dependencies with pnpm..."
pnpm install

# Copy .env.template files for foundry
if [ ! -f .env ]; then
    echo "Copying .env.template files for foundry and app..."
    cp .env.template .env
fi

# Copy .env.template files for app
if [ ! -f packages/app/.env ]; then
    echo "Copying packages/app/.env.template to packages/.env..."
    cp packages/apps.env.template packages/app/.env
fi

echo "Done!"