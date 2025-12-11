#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get current user and group IDs
USER_ID=${USER_ID:-$(id -u)}
GROUP_ID=${GROUP_ID:-$(id -g)}

# Build the Docker image
docker build \
  --build-arg USER_ID=${USER_ID} \
  --build-arg GROUP_ID=${GROUP_ID} \
  -f "${SCRIPT_DIR}/Dockerfile.copilot" \
  -t copilot:latest \
  "${SCRIPT_DIR}"

# Run the container
docker run -it --rm \
  --name copilot-cli \
  --user ${USER_ID}:${GROUP_ID} \
  -v "${PWD}:/workspace" \
  -v ~/.gitconfig:/home/copilot${USER_ID}/.gitconfig:ro \
  -v ~/.ssh:/home/copilot${USER_ID}/.ssh:ro \
  -e GITHUB_TOKEN="${GITHUB_TOKEN}" \
  -w /workspace \
  copilot:latest \
  \
  copilot \
  --allow-all-tools \
  --deny-tool 'shell(git remote)' \
  --deny-tool 'shell(git push)' \
  --deny-tool 'shell(rm)' \

