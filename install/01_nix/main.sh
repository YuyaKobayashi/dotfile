#!/bin/bash

set -ue

script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

# Install nix
if command -v nix >/dev/null 2>&1 ; then
    echo "Nix is already installed."
else
    if command -v curl >/dev/null 2>&1 ; then
        echo "curl is already installed."
    else
        sudo apt update
        sudo apt install -y curl
    fi
    sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
    source /etc/bashrc
fi

# Install nix packages
for pkg_list_file in $script_dir/*_list.txt; do
    nix profile add $(sed -e 's/^/nixpkgs#/' $pkg_list_file)
done
