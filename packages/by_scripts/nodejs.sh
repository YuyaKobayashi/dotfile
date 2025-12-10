#!/usr/bin/env bash
set -ue

# For Linux
if command -v fnm &> /dev/null; then
    :
else
    printf "fnm not found. Installing fnm...\n"
    curl -o- https://fnm.vercel.app/install | bash
fi

if command -v node &> /dev/null; then
    printf "Node.js is already installed. Version: $(node -v)\n"
else
    printf "Node.js not found. Installing Node.js version 24...\n"
    fnm install 24
fi
