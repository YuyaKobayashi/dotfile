#!/usr/bin/env bash
set -ue

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../utils.sh

if command -v apt &> /dev/null; then
    sudo apt -y update
    for list_text in $SCRIPT_DIR/*.txt; do
        if [[ $(basename "$list_text") == "default.txt" ]]; then
            cat $list_text | xargs sudo apt install -y
        fi
        if ask_yn "Want to install APT packages from $(basename "$list_text" | sed -e 's/\.txt$//g') list?"; then
            cat $list_text | xargs sudo apt install -y
        fi
    done
else
    echo "apt is not available on this system. This script supports only apt-based systems."
    exit 1
fi
