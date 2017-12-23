#!/usr/bin/env fish
set script_dir (cd (dirname (status -f)); pwd)

# source alias
source $script_dir/shell/alias

# Initialization for git
if [ -n "(command -s git)" ]
	function set_undefined_gitconfig
		set -l key $argv[1]
		set -l val $argv[2]
		if [ -z "(git config --get $key)" ]
			git config --global $key "$val"
		end
	end
	set_undefined_gitconfig alias.s status
	set_undefined_gitconfig alias.b branch
	set_undefined_gitconfig alias.a add
	set_undefined_gitconfig alias.d diff
	set_undefined_gitconfig alias.c "commit -v"
	set_undefined_gitconfig alias.l "log --deco"
	set_undefined_gitconfig merge.tool vimdiff
	set_undefined_gitconfig color.ui true
	set_undefined_gitconfig core.editor vim
	set_undefined_gitconfig user.name YuyaKobayashi
	set_undefined_gitconfig user.email ky.epk.leo@gmail.com

	functions -e set_undefined_gitconfig
end


# Initialization for .vimrc
set default_vimrc "$HOME/.vimrc"
set script_dir (cd (dirname (status -f)); pwd)
if [ -f "$default_vimrc" ]
else
	echo source $script_dir/.vimrc >$default_vimrc 
end
set -e default_vimrc
set -e script_dir
