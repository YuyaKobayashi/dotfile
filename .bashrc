#/bin/bash 

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

# export #TODO: split here into a separeted file
export SCREENRC="$script_dir/.screenrc"

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

source $script_dir/shell/alias

shopt -s autocd # no need to input 'cd'
shopt -s cdspell # do 'cd' successfully even if one character in given destination path name is wrong
shopt -s dirspell # correct typo when complementing path by <TAB>
shopt -s globstar # enable ** matching
shopt -s hostcomplete # enalbe complementing host name after @
shopt -s interactive_comments # ignore commands after # on interactive shell
shopt -s progcomp # enable complemention on program
shopt -s xpg_echo # enable echo to expand escape sequence
unset script_dir
