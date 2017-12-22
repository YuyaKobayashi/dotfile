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
