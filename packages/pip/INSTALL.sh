#!/usr/bin/env bash
set -ue

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../utils.sh

if command -v python3 &> /dev/null; then
    for list_text in $SCRIPT_DIR/*.txt; do
        if ask_yn "Want to install pip packages from $(basename "$list_text" | sed -e 's/\.txt$//g') list?"; then
            python3 -m pip install --user -r $list_text
        fi
    done
else
    echo "Python is not available on this system."
    exit 1
fi
