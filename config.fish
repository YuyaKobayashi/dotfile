#!/usr/bin/env fish
set script_dir (cd (dirname (status -f)); pwd)
set os (uname -s)

# alias
source $script_dir/shell/alias
switch "$os"
case "Linux"
	alias ls="ls -hF --color"
case "Darwin" "FreeBSD"
	alias ls="ls -hFG"
end


# Initialization for git
if [ -n (command -s git) ]
	function set_undefined_gitconfig
		set -l key $argv[1]
		set -l val $argv[2]
		if [ -z (git config --get $key) ]
			git config --global $key "$val"
		end
	end
	cat $script_dir/shell/gitconfig | while read key val
		set_undefined_gitconfig $key "$val"
	end

	functions -e set_undefined_gitconfig
end


# Initialization for .vimrc
set default_vimrc "$HOME/.vimrc"
if [ -f "$default_vimrc" ]
else
	echo source $script_dir/.vimrc >$default_vimrc 
end
set -e default_vimrc
set -e script_dir
set -e os

cd ~
