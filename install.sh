#!/bin/bash

#
# This script just modifies ~/.bashrc to source ./.bashrc.
# Any modification in this repository is reflected on sourcing ./.bashrc.
#

user_bashrc=${HOME}/.bashrc
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)
install_cmd="source $script_dir/.bashrc"
if [[ ! -f $user_bashrc ]] || [[ -z "cat $user_bashrc | grep $install_cmd" ]]; then
	echo $install_cmd >>$user_bashrc
fi
