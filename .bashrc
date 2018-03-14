#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# added by travis gem
[ -f /home/mpdeimos/.travis/travis.sh ] && source /home/mpdeimos/.travis/travis.sh

export QT_QPA_PLATFORMTHEME="qt5ct"
