#!/usr/bin/env bash
set -ue

ask_yn() {
    # Usage: ask_yn "Your question here"
    local prompt="$1"
    local response

    while true; do
        echo
        read -rp "$prompt [y/n]: " response
        case "$response" in
            [Yy]* ) return 0;;  # Yes
            [Nn]* ) return 1;;  # No
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done
}
