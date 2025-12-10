#!/usr/bin/env bash
set -ue

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../utils.sh

if command -v fish &> /dev/null; then
    for list_text in $SCRIPT_DIR/*.txt; do
        if ask_yn "Want to install fish plugins from $(basename "$list_text" | sed -e 's/\.txt$//g') list?"; then
            cat $list_text | xargs -n1 -IXXX fish -c 'fisher install XXX'
        fi
    done
else
    echo "fish is not available on this system. This script supports only apt-based systems."
    exit 1
fi
