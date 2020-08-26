shell=`ps | grep $$ | awk '{ print $4 }'`


# BASH

if [[ "$shell" == "bash" ]]
then
	# Colorize ls
	alias ls='ls --color=auto'
	
	# Easier navigation: .., ..., ~ and -
	alias ..="cd .."
	alias ...="cd ../.."
	alias -- -="cd -"

	# List only directories
	alias lsd='ls -l | grep "^d"'
	alias ll='ls -l'
	alias la='ls -la'
fi


# ZSH

if [[ "$shell" == "zsh" ]]
then
	autoload -U zmv
	alias mmv='noglob zmv -W'
fi


# access to dotfiles git
alias dotfiles='GIT_DIR=~/.dotgit git'


# File size
alias fs="stat -f \"%z bytes\""


# ping google
alias pg="ping www.google.com"


# clipboard
alias cb='xclip -selection c'
alias cwd='echo -n `pwd` | cb'
alias t='xdotool sleep 1 type --clearmodifiers'
alias tcb='xdotool sleep 1 type --clearmodifiers "`xclip -o -selection clipboard`"'


# open & find
alias o='gio open'

function f() {
	find . -name "$1"
	echo -n "Open files? [Y/n]: "
	read NO_OPEN
	if [[ "$NO_OPEN" != "n" ]]
	then
		find . -name "$1" -exec xdg-open {} \;
	fi
}

if [[ "$shell" == "bash" ]]
then
	export -f f
fi


# error handling for the last command
if [ -x "$(command -v thefuck)" ]
then
	eval $(thefuck --alias)
fi

alias please='sudo $(fc -ln -1)'


# serving the current directory

alias serve='python -m http.server 8000'
