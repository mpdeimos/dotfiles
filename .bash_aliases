shell=`ps | grep $$ | awk '{ print $4 }'`
if [[ "$shell" == "bash" ]]
then
	# Easier navigation: .., ..., ~ and -
	alias ..="cd .."
	alias ...="cd ../.."
	alias -- -="cd -"

	# List only directories
	alias lsd='ls -l | grep "^d"'
	alias ll='ls -l'
	alias la='ls -la'
fi

if [[ "$shell" == "zsh" ]]
then
	autoload -U zmv 
	alias mmv='noglob zmv -W'
fi


# File size
alias fs="stat -f \"%z bytes\""

# ping google
alias pg="ping www.google.com"

# clipboard
alias cb='xclip -selection c'
alias cwd='pwd | cb'

# open
alias o='gnome-open'

# sudo
alias please='sudo $(fc -ln -1)'

alias serve='python -m http.server 8000'
