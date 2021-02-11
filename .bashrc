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

# Initialization for nvim
default_nvim_init="$HOME/.config/nvim/init.vim"
if [[ -f "$default_vimrc" ]]; then
	:
else
	if [[ -n "$(command -v nvim)" ]]; then
		mkdir -p $(dirname $default_nvim_init)
		echo source $script_dir/.vimrc >$default_nvim_init
	fi
fi


# launch fish shell
if [[ -n "$(command -v fish)" ]] && [[ -z "$DISABLE_FISH" ]]; then
       fish
       exit
fi

# export 
cat $script_dir/shell/export | while read key val; do
	eval export ${key}=$val
done
cat $script_dir/shell/local_export | while read key val; do
	eval export ${key}=$val
done

# alias
source $script_dir/shell/alias
if [[ "$os" == "Linux" ]]; then
	alias ls="ls -hF --color"
elif [[ "$os" == "Darwin" ]] || [[ "$os" == "FreeBSD" ]]; then
	alias ls="ls -hFG"
fi

# installation
## pyenv
if [[ -d $PYENV_ROOT ]]; then
	:
else
	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi
eval "$(pyenv init -)"

# shell options
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
