#
# /etc/bash.bashrc
#

[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s hostcomplete

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

export EDITOR=vim
export VISUAL=vim

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'
alias la='ls -lah' 
alias l='ls -lAh'
alias status='systemctl status'
alias sc='systemctl'
alias st='systemctl status'
alias grep='grep -i --color=auto'
alias u='cd ..'
alias diff='colordiff'
function cdl { cd $1 && l; }
alias vimrc='sudo vim /etc/vimrc'
alias svim='sudo vim'
export LESS='-iR'
alias pi='sudo pacman -S'
alias pm='sudo pacman'
alias pa='pacaur -Sa'
alias tree='tree -Chal --dirsfirst'
function tl { tree $1|less; }
function plog { grep $1 /var/log/pacman.log; }
function s { systemctl status $1; }
alias v='vim $(fzf -m)'
alias sv='sudo vim $(fzf -m)'

# Farger i less, kun manpages
man() {
    env LESS_TERMCAP_mb=$'\E[1;31m' \
	LESS_TERMCAP_md=$'\E[1;37m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[35m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[4;34m' \
	man "$@"
    }

# Farger i less, ellers
# Ser ikke ut til å gjøre noe
#export LESS=-R
#export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
#export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
#export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
#export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
#export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
#export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
#export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Buker Nord sine dir_colors
#eval "$(dircolors /etc/dir_colors)"
eval $(dircolors)

if [[ $TERM == xterm-termite ]]; then 
	. /etc/profile.d/vte.sh
	__vte_prompt_command
fi

# fzf
export FZF_DEFAULT_OPTS='--height=25%'
