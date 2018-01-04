#/bin/bash 

os=$(uname -s)
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

# Initialization for git
if [[ -n "$(command -v git)" ]]; then
	set_undefined_gitconfig(){
		local key=$1
		local val=$2
		if [[ -z "$(git config --get $key)" ]] ; then
			git config --global $key "$val"
		fi
	}
	cat $script_dir/shell/gitconfig | while read key val; do
		set_undefined_gitconfig $key "$val"
	done

	unset -f set_undefined_gitconfig
fi

# Initialization for .vimrc
default_vimrc="$HOME/.vimrc"
if [[ -f "$default_vimrc" ]]; then
	:
else
cat >$default_vimrc <<_EOS_
source $script_dir/.vimrc
_EOS_
fi
unset default_vimrc


# launch fish shell
if [[ -n "$(command -v fish)" ]]; then
       fish
       exit
fi

# export #TODO: split here into a separeted file
export SCREENRC="$script_dir/.screenrc"

# alias
source $script_dir/shell/alias
if [[ "$os" == "Linux" ]]; then
	alias ls="ls -hF --color"
else if [[ "$os" == "Darwin" ]] || [[ "$os" == "FreeBSD" ]]; then
	alias ls="ls -hFG"
fi

# installation
## pyenv
pyenv_root=$HOME/.pyenv
if [[ -d $pyenv ]]; then
	:
else
	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi
unset pyenv_root

shopt -s autocd # no need to input 'cd'
shopt -s cdspell # do 'cd' successfully even if one character in given destination path name is wrong
shopt -s dirspell # correct typo when complementing path by <TAB>
shopt -s globstar # enable ** matching
shopt -s hostcomplete # enalbe complementing host name after @
shopt -s interactive_comments # ignore commands after # on interactive shell
shopt -s progcomp # enable complemention on program
shopt -s xpg_echo # enable echo to expand escape sequence

unset script_dir
unset os
