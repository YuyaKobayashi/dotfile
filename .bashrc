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
git config --global alias.s status
git config --global alias.b branch
git config --global alias.a add
git config --global alias.d diff
git config --global alias.c "commit -v"
git config --global alias.l "log --deco"
git config --global merge.tool vimdiff
git config --global color.ui true
git config --global core.editor vim
git config --global user.name YuyaKobayashi
git config --global user.email ky.epk.leo@gmail.com

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
