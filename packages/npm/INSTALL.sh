#!/usr/bin/env bash
set -ue

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../utils.sh

if command -v npm &> /dev/null; then
    for list_text in $SCRIPT_DIR/*.txt; do
        if ask_yn "Want to install node packages from $(basename "$list_text" | sed -e 's/\.txt$//g') list?"; then
            cat $list_text | xargs -n1 npm install -g
        fi
    done
else
    echo "npm is not available on this system."
    exit 1
fi
