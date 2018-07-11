# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Farge
# fargen og 0m resetter
PS1='\[\e]2;$PWD\a\]\[\e[1;32m\][\u]\[\e[1;34m\][\w]\$\[\e[0m\] '
