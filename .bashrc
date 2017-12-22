#/bin/bash 

alias rm="rm -i"
alias py="python3"
alias sc="screen"
alias g="git"
alias gi="git"
alias l="ls --color"
alias v="vim"
alias grep="grep --color"

shopt -s autocd # no need to input 'cd'
shopt -s cdspell # do 'cd' successfully even if one character in given destination path name is wrong
shopt -s dirspell # correct typo when complementing path by <TAB>
shopt -s globstar # enable ** matching
shopt -s hostcomplete # enalbe complementing host name after @
shopt -s interactive_comments # ignore commands after # on interactive shell
shopt -s progcomp # enable complemention on program
shopt -s xpg_echo # enable echo to expand escape sequence

# Initialization for git
if [[ -n "$(command -v git))" ]]; then
	set_undefined_gitconfig(){
		local key=$1
		local val=$2
		if [[ -z "$(git config --get $key)" ]] ; then
			git config --global $key "$val"
		fi
	}
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

	unset -f set_undefined_gitconfig
fi

# Initialization for .vimrc
default_vimrc="$HOME/.vimrc"
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)
if [[ -f "$default_vimrc" ]]; then
	:
else
cat >$default_vimrc <<_EOS_
source $script_dir/.vimrc
_EOS_
fi
unset default_vimrc
unset script_dir
