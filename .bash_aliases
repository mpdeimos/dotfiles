# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# List only directories
alias lsd='ls -l | grep "^d"'
alias ll='ls -l'
alias la='ls -la'

# Shortcuts
alias d="cd ~/Downloads"
alias ws="cd ~/workspaces"
alias wsp="cd ~/workspaces/php"
alias wscq="cd ~/workspaces/cq"
alias wsj="cd ~/workspaces/java"
alias wsa="cd ~/workspaces/android"

# File size
alias fs="stat -f \"%z bytes\""

# ping google
alias pg="ping www.google.com"
