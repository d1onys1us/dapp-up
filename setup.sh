#!/bin/bash

set -e

# Run forge install
echo "Installing forge dependencies..."
forge install

echo "Installing node dependencies..."
pnpm install

# Copy .env.example to .env
if [ ! -f .env ]; then
    echo "Copying .env.example to .env..."
    cp .env.example .env
fi

echo "Done! ✨"
