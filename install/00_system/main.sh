#!/bin/bash

set -ue

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo apt update
sudo apt install -y curl git vim wget tar
