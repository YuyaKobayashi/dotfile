#!/usr/bin/env bash
set -ue

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../utils.sh

for script_file in $SCRIPT_DIR/*.sh; do
    if [[ "$(basename $script_file)" == "INSTALL.sh" ]]; then
        continue
    fi
    if ask_yn "Want to install $(basename $script_file | sed -e 's/\.sh$//g')?"; then
        bash "$script_file"
    fi
done
