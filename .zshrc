# Farger for man
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

# Lar deg bruke navn på farger istedetfor escape codes
autoload -U colors && colors

# Sett LS_COLORS
#eval $(dircolors)
eval $(dircolors /home/jonas/.nord_dircolors)

export EDITOR=nvim
export VISUAL=nvim

# Inkluder global-dir for npm pakker i path
NPM_PACKAGES="${HOME}/.npm-global"
PATH="$NPM_PACKAGES/bin:$PATH"

# Ruby gems i path
PATH="/home/jonas/.gem/ruby/2.5.0/bin:$PATH"

# For at termite skal kunne vite hvilken mappe du er i og starte en ny terminal derfra
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

export TERM=xterm-256color

autoload -U select-word-style
select-word-style bash

autoload -Uz compinit promptinit
compinit
promptinit

autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

autoload -U zmv




## COMPLETION START

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt CASE_GLOB

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' expand prefix

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
## COMPLETION END

## Options
setopt complete_in_word
setopt always_to_end
setopt pathdirs
setopt extendedglob 
setopt nomatch 
setopt notify
unsetopt beep
unsetopt flowcontrol
setopt RC_QUOTES
setopt clobber
setopt globdots

## History
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

# Directory stack
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

switch-to-dir () {
	[[ ${#dirstack} -eq 0 ]] && return

	while ! builtin pushd -q $1 &>/dev/null; do
		# We found a missing directory: pop it out of the dir stack
		builtin popd -q $1

		# Stop trying if there are no more directories in the dir stack
		[[ ${#dirstack} -eq 0 ]] && break
	done
}

insert-cycledleft () {
	emulate -L zsh
	setopt nopushdminus

	switch-to-dir +1
	zle reset-prompt
}
zle -N insert-cycledleft

insert-cycledright () {
	emulate -L zsh
	setopt nopushdminus

	switch-to-dir -0
	zle reset-prompt
}
zle -N insert-cycledright

# Command-not-found
source /usr/share/doc/pkgfile/command-not-found.zsh

# alias for run-help og helper functions
# kan brukes istedetfor man, bruker man for eksterne og run-help for interne
autoload -Uz run-help
alias help=run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# To avoid the need to manually reset the terminal
ttyctl -f

# Nødvendig for å bruke cdr for recent directories
# Også nødvendig for fzf recent dirs
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Hvis du vil rehashe completions automatisk (når nye pakker har blitt installert)
#zstyle ':completion:*' rehash true


## Aliaser

alias ls='ls -h --color=auto --group-directories-first'
alias l='ls -l'
alias ll='ls -la'
alias sc='sudo systemctl'
alias st='systemctl status'
alias grep='grep -i --color=auto'
alias u='cd ..'
alias diff='colordiff'
alias svim='sudo nvim'
export LESS='-iRk /home/jonas/.less'
alias pi='sudo pacman -S'
alias pm='sudo pacman'
alias pa='pacaur -Sa'
alias tree='tree -Chal --dirsfirst'
function tless { tree $@|less; }
function plog { grep $@ /var/log/pacman.log; }
function path { echo $PATH | tr ":" "\n"; }
alias rg='rg -S' # Smartcase
alias pu='pacui'
alias vim='nvim'
alias vrc='nvim /home/jonas/.config/nvim/init.vim'
alias ag='ag --color-path=0\;34 --color-line-number=0\;32 --color-match=1\;31'
# alias ip='ip -color -br addr'
alias ip='ip -color'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tm='tmux'
alias tl='tmux ls'
alias td='tmux kill-session -t'
alias p='print -l'
alias tldr='tldr -t ocean'
alias cdu='cdu -idh'
function agl() {ag --color -W 100 $@ 2> /dev/null | less}

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gds='git diff-tree  --stat'
alias gco='git checkout'
alias gf='git fetch'
alias gm='git merge'
alias gpl='git pull'
alias gpu='git push'
alias g='git status'
alias gs='git status -s'
alias gss='git status'
alias gsh='git show'
alias gl='git log'
alias gll='git log --pretty=oneline --abbrev-commit' 
alias glg='git log --graph --pretty=oneline --abbrev-commit'
alias gwh='git whatchanged -p --abbrev-commit' 
alias gsb='git show-branch'



## Funksjoner

# Auto-ls
function chpwd() {
    emulate -L zsh
    l
}

# zman for å finne dokumentasjon
zman() {
 PAGER="less -g -s '+/^       "$1"'" man zshall
}

paclist() {
  # Source: https://bbs.archlinux.org/viewtopic.php?id=93683
  LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
    awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
}



## Keybindings

bindkey -e


# Hist substring search 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Undo
bindkey '^[u' undo
bindkey '^[U' redo
bindkey ' ' magic-space
# shift-tab
bindkey '^[[Z' reverse-menu-complete

# file rename magick
bindkey "^[m" copy-prev-shell-word

bindkey "^[w" backward-kill-word

## PLUGIN LOAD
# Dynamic
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# Static
# antibody bundle < ~/plugins.txt > ~/.zsh_plugins.sh
# source .zsh_plugins.sh


## Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets line)
ZSH_HIGHLIGHT_STYLES[path]=none

# Hindre tab på tom linje
function expand-or-complete-or-list-files() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="ls "
        CURSOR=3
        zle list-choices
        zle backward-kill-word
    else
        zle expand-or-complete
    fi
}
zle -N expand-or-complete-or-list-files
bindkey '^I' expand-or-complete-or-list-files

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='
--height=30% --reverse --bind "tab:down,btab:up,ctrl-space:toggle+down,alt-q:abort"
--color fg:-1,bg:-1,bg+:-1
'
export FZF_DEFAULT_COMMAND='fd -IH'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^[t' fzf-completion
bindkey '^I' $fzf_default_completion

fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Ctrl up
parent-directory-widget() {
	zle kill-buffer
	cd ..
    zle reset-prompt
}
zle -N parent-directory-widget
bindkey '^U' parent-directory-widget

insert-wildcard-widget() {
    LBUFFER=${LBUFFER}'**/*'
}
zle -N insert-wildcard-widget
bindkey '^[w' insert-wildcard-widget

service-status-widget() {
    zle kill-whole-line
    local service
    service=$(systemctl list-unit-files --no-pager| cut -d' ' -f1| tail -n +2 | head -n -2| sed '/^-/d' | fzf);
    if [[ -n $service ]]
    then
        systemctl status $service
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N service-status-widget

global-cd-widget() {
    zle kill-buffer
    local file
    file="$(locate -Ai -0 / | grep -z -vE '~$' | fzf --read0 -0 -1 --preview 'tree -C {} | head -200')"
    if [[ -n $file ]]
    then
        if [[ -d $file ]]
        then
            cd -- $file
            zle reset-prompt
        else
            cd -- ${file:h}
            zle reset-prompt
        fi
    else
        zle reset-prompt
    fi
}
zle -N global-cd-widget

locate-widget() {
    local target
    target="$(locate -Ai -0 / | grep -z -vE '~$' | fzf --read0 -0 -1 --preview 'tree -C {} | head -200')"
    if [[ -n $target ]]
    then
        LBUFFER+="$target "
        zle redisplay
    else
        zle redisplay
    fi
}
zle -N locate-widget


edit-file-widget() {
    zle kill-buffer
    local file
    file=$(fd -H -t f -c never . /home/jonas | grep -v '~$' | fzf)
    if [[ -n $file ]]
    then
    	zle redisplay
        BUFFER="vim $file"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N edit-file-widget

edit-global-widget() {
    zle kill-buffer
    local file
    find_cmd="sudo fd -H -t f -c never ."
    file=$({eval ${find_cmd} /etc & \
        eval ${find_cmd} /usr/lib & \
        eval ${find_cmd} /usr/local & \
        eval ${find_cmd} /usr/share & \
        eval ${find_cmd} /var/log;} | \
         grep -v '~$'| fzf);
    if [[ -n $file ]]
    then
    	zle redisplay
        BUFFER="sudo nvim $file"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N edit-global-widget

kill-processes-widget() {
    zle kill-buffer
    LBUFFER="kill "
    fzf-completion
    zle accept-line
}
zle -N kill-processes-widget

vf() {
    local file
    file=$(rg -l $@ | fzf --preview 'cat {}');
    if [[ -n $file ]]
    then
        vim $file
    fi
}

fag() {
  local line
  line=$(ag -nocolor "$@" | fzf) \
    && vim $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
}    

galias() {
    alias|grep git --color=never 
}

bindkey '^[s' service-status-widget
bindkey '^[e' edit-file-widget
bindkey '^[E' edit-global-widget
bindkey '^[g' global-cd-widget
bindkey '^[k' kill-processes-widget
bindkey '^[i' locate-widget

# fzf-widgets
bindkey '^[r' fzf-change-recent-directory

# Cycle dirstack, må være etter plugins
# Ctrl-Left, Ctrl-Right
bindkey ';5D' insert-cycledleft
bindkey ';5C' insert-cycledright

# Alt-left, alt-right
bindkey ';3C' forward-word
bindkey ';3D' backward-word

# Taken by tmux prefix
bindkey '^S' undefined-key

bindkey '^[L' undefined-key
bindkey '^[l' undefined-key
bindkey '^Q' kill-buffer
bindkey '^[q' kill-buffer

