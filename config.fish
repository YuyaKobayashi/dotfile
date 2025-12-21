#!/usr/bin/env fish
set old_cwd (pwd)
set script_dir (cd (dirname (status -f)); pwd)
set os (uname -s)

# alias
source $script_dir/shell/alias
source $script_dir/shell/custom_cmds.fish

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

# export 
cat $script_dir/shell/export | while read key val
	if [ "$key" = "PATH" ]
		eval set -x $key (echo $val | tr ":" " ")
	else
		eval set -x $key "$val"
	end
end

if [ -f "$script_dir/shell/local_export" ]
    cat $script_dir/shell/local_export | while read key val
        if [ "$key" = "PATH" ]
            eval set -x $key (echo $val | tr ":" " ")
        else
            eval set -x $key "$val"
        end
    end
end


set -e script_dir
set -e os


# fish prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

## fish git prompt
#set __fish_git_prompt_showdirtystate 'yes'
#set __fish_git_prompt_showstashstate 'yes'
#set __fish_git_prompt_showuntrackedfiles 'yes'
#set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate 'd'
set __fish_git_prompt_char_stagedstate 's'
set __fish_git_prompt_char_untrackedfiles 'z'
set __fish_git_prompt_char_stashstate '*'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt
	set last_status $status

	set_color $fish_color_cwd
	printf '%s@%s ' $USER (hostname -s)
	
	set_color blue
	printf '%s' (prompt_pwd)

	set_color normal
	printf '%s> ' (__fish_git_prompt)

	set_color normal
end

cd $old_cwd
