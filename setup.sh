#!/bin/bash

# Run forge install
echo "Installing forge dependencies..."
forge install

echo "Installing node dependencies with pnpm..."
pnpm install

# Copy .env.example files for foundry
if [ ! -f .env ]; then
    echo "Copying .env.example to .env... (foundry)"
    cp .env.example .env
fi

# Copy .env.example files for app
if [ ! -f packages/app/.env ]; then
    echo "Copying packages/app/.env.example to packages/app/.env... (app)"
    cp packages/app/.env.example packages/app/.env
fi

echo "Done!"