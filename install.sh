#!/bin/bash

#
# This script just modifies ~/.bashrc to source ./.bashrc.
# Any modification in this repository is reflected on sourcing ./.bashrc.
#

script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

# for bash
user_bashrc=${HOME}/.bashrc
install_cmd="source $script_dir/.bashrc"
if [[ ! -f $user_bashrc ]] || [[ -z "cat $user_bashrc | grep $install_cmd" ]]; then
	echo $install_cmd >>$user_bashrc
fi

# for fish
user_fish_config=${HOME}/.config/fish/config.fish
install_cmd="source $script_dir/config.fish"
if [[ ! -f $user_fish_config ]] || [[ -z "cat $user_fish_config | grep $install_cmd" ]]; then
	mkdir -p $(dirname $user_fish_config)
	echo $install_cmd >>$user_fish_config
fi

# install nvim
NVIM_HOME=$HOME/install.d/neovim
mkdir -p $NVIM_HOME
url -o $NVIM_HOME/nvim -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x $NVIM_HOME/nvim

