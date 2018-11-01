# Farger for man
man() {
    env LESS_TERMCAP_mb=$'\E[1;31m' \
    LESS_TERMCAP_md=$'\E[1;37m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[1;32m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[4;34m' \
    man "$@"
    }

# Lar deg bruke navn på farger istedetfor escape codes
autoload -U colors && colors

# Sett LS_COLORS
eval $(dircolors)
# eval $(dircolors /home/jonas/.nord_dircolors)

export EDITOR=nvim
export VISUAL=nvim

# Inkluder global-dir for npm pakker i path
NPM_PACKAGES="${HOME}/.npm-global"
PATH="$NPM_PACKAGES/bin:$PATH"
# Ruby gems i path
PATH="/home/jonas/.gem/ruby/2.5.0/bin:$PATH"
# Rust i path
PATH="/home/jonas/.cargo/bin:$PATH"
export PATH


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

# Menu-select completion # Added 27 Jul 2018
zstyle ':completion:*' menu select
# Nødvendig for å kunne binde til menuselect keymap
zmodload zsh/complist
# For å slippe to ganger enter
bindkey -M menuselect '^M' .accept-line

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
#for index ({1..9}) alias "$index"="cd +${index}"; unset index

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
# alias ls='/opt/coreutils/bin/ls -h --color=auto --group-directories-first'
alias l='ls -l'
alias ll='ls -la'

function e() {
    if [[ -n $@ ]]; then
        echo $@
    else
        local var=$(set | cut -d= -f1 | fzf)
        echo ${(P)var}
    fi
}
compdef _vars e

alias p='print -l'
alias o='xdg-open'
alias h='history'
alias lo='locate'
alias u='cd ..'
alias ax='chmod a+x'
function vsh(){
    if [[ -n $1 ]]; then
        if [[ -w $(dirname $1) ]]; then
            echo '#!/usr/bin/bash\n\n' > $1; chmod a+x $1; $EDITOR $1 +3
        else
            sudo touch $1
            sudo chown $USER:$USER $1
            chmod a+x $1
            echo '#!/usr/bin/bash\n\n' > $1
            $EDITOR $1 +3
        fi
    fi
}

alias path='echo $PATH | tr ":" "\n"'
export LESS='-iRk /home/jonas/.less'
alias tree='tree -Chal --dirsfirst'
function trl() {tree $@ | less}
alias diff='colordiff'
# alias pass='dump.py|awk "{print $2,$4}"|rg https://|sed "s,https://,,"|fzf|cut -d" " -f2|tr -d "\n"|xsel -ib'
function pass() {
    dump.py|awk '{print $2":",$4}'|rg https://|sed 's,https://,,'|fzf|cut -d' ' -f2|tr -d '\n'|xsel -ib
}
function conf() {(fd -H "${@}" /etc; fd -H "${@}" ~/.config)}

alias grep='grep -i --color=auto'
alias fd='fd -I' # ignored
alias fh='fd -H' # hidden and ignored
alias ag='ag -t --color-path=0\;34 --color-line-number=0\;32 --color-match=1\;31' # ignored
alias ah='ag --hidden' # hidden and ignored
function agl() {ag $@ --pager less 2> /dev/null}
alias rg='rg -uS' # ignored, smartcase
alias rh='rg -uu' # hidden and ignored
function rgl() {rg -p $@ 2> /dev/null | less}

alias v='nvim'
alias vim='nvim'
alias sv='sudo nvim'
alias svim='sudo nvim'
alias vrc='nvim ~/.config/nvim/init.vim'
alias em='emacsclient -c -a=""'

alias ta='tmux attach'
alias tma='tmux attach -t $(tmux list-sessions|fzf|cut -f1 -d:)'
alias tn='tmux new -s'
alias tm='tmux'
alias tl='tmux ls'
alias tk='tmux kill-session -t $(tmux list-sessions|fzf|cut -f1 -d:)'

alias pm='sudo pacman'
alias pa='pacaur'
alias pu='sudo pacman -Syu --noconfirm'
alias puu='pacaur -Syu --noconfirm'
alias pls='pacaur -Ql'
alias pf='pacaur -Fs'
alias po='pacaur -Qo'
alias pt='pactree -cs'
alias deps='pactree -cd1'
alias sdeps='pactree -scd1'
alias plog='paclog'
alias pl='paclog'
alias pla='paclog --color --action all'
alias plc='paclog --color --commandline|rg -v -e "pacman -D" -e "-Ud"'
alias plw='paclog --warnings'
alias plg='paclog --grep'

alias sc='sudo systemctl'
alias st='systemctl status'
alias dmesg='dmesg -HP --color=always' # funker med grepping og less, men kan være andre ting som ikke funker

alias ip='ip -color'
alias ipp='ip -br addr && ip -br link'
# alias ip='ip -color -br'
alias dfc='dfc -wT'
alias cdu='cdu -idh'
alias ht='htop'
alias htop='sudo htop'
# function smem() {
#     (sudo smem -pt $@ | tail -n 1;
#     smem -kt $@) | command less
#     }
alias smem='sudo smem -kt'
alias pgrep='sudo pgrep -li'


alias tldr='tldr -t ocean'

alias aria='aria2c'
alias sub='subliminal download -l en'

alias fkprint='lp -d fkprint -h printhost.samfundet.no'

alias li='light -S'
alias cl='xsel -ib'

alias clone='git clone'
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

vg() {
    if [[ -z $@ ]]
    then
        return
    fi
    local file=$(rg -uul $@ | fzf --preview="rg --color=always -C3 \"${@}\" {}");
    if [[ -n $file ]]
    then
        local line=$(rg -n $@ "${file}" | head -n1 | cut -d: -f1)
        vim +$line "${file}"

    fi
}

vf() {
    local file=$(fd -tf -H "$@" | fzf --preview "echo {} | rg --color=always \"$@\"" --preview-window up:1);
    if [[ -n $file ]]
    then
        vim "${file}"
    fi
}

fag() {
  local line=$(ag -nocolor "$@" | fzf) \
    && vim $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
}    

mykeys() {
    (
    echo "ZSH";
    ag 'bindkey|alias' --nonumbers ~/.zshrc --color;
    echo "TMUX";
    ag 'bind ' --nonumbers ~/.tmux.conf --color;
    ) | less
}

# pi() {
#     if [[ -n $@ ]]
#     then
#         result=$(comm -23 <(pacman -Ssq $@|sort) <(pacman -Qq|sort) | fzf)
#     else
#         result=$(comm -23 <(pacman -Slq|sort) <(pacman -Qq|sort) | fzf)
#     fi

#     sudo pacman -S $result
# }

pi() {
    if [[ -n $@ ]]
    then
        result=$(comm -23 <(pacaur -Ssq $@|sort) <(pacman -Qq|sort) | fzf --preview 'pacaur -Si {}')
    else
        result=$(comm -23 \
        <((
        curl https://aur.archlinux.org/packages.gz -o - 2> /dev/null | zcat;
        pacman -Slq;
            )|sort) \
        <(pacman -Qq|sort) \
        | fzf --preview 'pacaur -Si {}')
    fi

    pacaur -S --noedit $result
}

pg() {
    if [[ -n $@ ]]
    then
        result=$(pacaur -Ssq $@ | fzf --preview 'pacaur -Si {}')
    else
        result=$( \
            (
        curl https://aur.archlinux.org/packages.gz -o - 2> /dev/null | zcat;
        pacman -Slq;
            ) | sort | fzf --preview 'pacaur -Si {}')
    fi

    pacaur -Si $result
}

pq() {
    if [[ -n $@ ]]
    then
        result=$(pacman -Qqs $@ | fzf --preview 'pacman -Qi {}')
    else
        result=$(pacman -Qq | fzf --preview 'pacman -Qi {}')
    fi

    if [[ -n $result ]]; then
        pacaur -Qi $result
        pacman -Ql $result | grep --color=never "/usr/bin/"
    fi
}

pr() {
    if [[ -n $@ ]]; then
        result=$(pacman -Qqs $@ | fzf --preview 'pacman -Qi {}')
    else
        result=$(pacman -Qq | fzf --preview 'pacman -Qi {}')
    fi

    [[ -n $result ]] && sudo pacman -Rns $result
}

pr() {
    if [[ -n $@ ]]
    then
        result=$(pacman -Qqs $@ | fzf --preview 'pacman -Qi {}')
    else
        result=$(pacman -Qq | fzf --preview 'pacman -Qi {}')
    fi

    [[ -n $result ]] && sudo pacman -Rns $result
}

pd() {
    sudo pacman -Rns $(pacman -Qqdt)
}

ali() {
    local cmd=$(alias|fzf|cut -d\' -f2)
    if [[ -n $cmd ]]
    then
        echo $cmd
        eval $cmd
    fi
}


psq() {
    local pid=$(ps -e hc -o pid,user,args|fzf|awk '{print $1}')
    if [[ -n $pid ]]
    then
        ps -o f,s,user,pid,ppid,pgid,lwp,nlwp,sid,tty,cmd,comm -p $pid | column -t
        echo
        ps -o pri,ni,start_time,etime,time,rss,vsz,pmem,pcpu,uunit -p $pid | column -t
        local cmdname=$(ps -o comm -p $pid | tail -n1)
        echo
        ps -H -C $cmdname -o user,pid,lwp,pgid,cmd
        echo
        ps -T -p $pid -o f,s,user,pid,lwp,spid,comm
    fi
}

purl() {
    local url=$(pacaur -Qi `pm -Qq|fzf` | rg '^URL'|awk '{print $3}')
    test -n $url && xdg-open "${url}" &> /dev/null
}

ap() {
    local file=$(rg --files -uu 2> /dev/null | sed 's/^\/home\/jonas\///' | sed '/~$/d' | fzf --prompt='~/' \
        --preview='[[ $(file --mime {}) =~ binary ]] &&
        echo {} is a binary file ||
        (highlight -O ansi -l {} ||
        cat {}) 2> /dev/null | head -500'
    )
    if [[ -n $file ]]
    then
        file=$(realpath $file)
        if [[ $(file --mime $file) != *"binary"* ]]
        then
            echo $@ >> $file
        else
            echo "Binary file, nothing appended"
            return 1
        fi
    else
        return 1
    fi

}




## PLUGIN LOAD
# Dynamic
source <(antibody init)
antibody bundle < ~/.zplugins.txt

# Static
# antibody bundle < ~/.zplugins.txt > ~/.zplugins.sh
# source .zplugins.sh


## Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets line)
ZSH_HIGHLIGHT_STYLES[path]=none

# Tror denne må være før mye
bindkey -e

## WIDGETS

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

sc-widget() {
    zle kill-buffer
    local service=$(systemctl list-unit-files --no-pager| cut -d' ' -f1| tail -n +2 | head -n -2| sed '/^-/d' | rg -v @ | fzf --preview="systemctl status -n0 {}");
    if [[ -n $service ]]
    then
        zle redisplay
        systemctl status --no-pager $service
        zle accept-line
        local action=$(echo "show\nenable\ndisable\nstart\nstop\nrestart\nreload"|fzf)
        if [[ -n $action ]]
        then
            zle redisplay
            BUFFER="sudo systemctl $action $service"
            zle accept-line
        else
            zle reset-prompt
        fi
    else
        zle reset-prompt
    fi
}
zle -N sc-widget

global-cd-widget() {
    zle kill-buffer
    local file="$(locate -0 / | grep -z -vE '~$' | fzf --read0 -0 -1 --preview 'tree -C {} | head -200')"
    if [[ -n $file ]]
    then
        if [[ -d $file ]]
        then
            cd -- "$file"
            zle reset-prompt
        else
            cd -- "${file:h}"
            zle reset-prompt
        fi
    else
        zle reset-prompt
    fi
}
zle -N global-cd-widget

insert-widget() {
    local target="$(locate -Ai -0 / | grep -z -vE '~$' | fzf --read0 -0 -1 --preview 'tree -C {} | head -200')"
    if [[ -n $target ]]
    then
        LBUFFER+="$target "
        zle redisplay
    else
        zle redisplay
    fi
}
zle -N insert-widget


edit-local-widget() {
    zle kill-buffer
    # file=$(fd -H -tf -c never . ~ | rg -v '~$' | fzf --preview="head {}")
    local file=$(rg --files -uu | sed 's/^\/home\/jonas\///' | sed '/~$/d' | fzf --prompt='~/' \
        --preview='[[ $(file -b --mime {}) =~ binary ]] &&
        file -b {} ||
        (highlight -O ansi -l {} ||
        cat {}) 2> /dev/null | head -500'
    )
    if [[ -n $file ]]
    then
        file=$(realpath $file)
        zle redisplay
        if [[ ! $(file --mime $file) =~ 'binary' ]]
        then
            BUFFER="vim \"${file}\""
            zle accept-line
        fi
    else
        zle reset-prompt
    fi
}
zle -N edit-local-widget

edit-global-widget() {
    zle kill-buffer
    find_cmd="sudo rg --files -uu"
    local file=$(
    (eval ${find_cmd} /etc
    eval ${find_cmd} ~/
    eval ${find_cmd} /usr/lib
    eval ${find_cmd} /usr/local
    eval ${find_cmd} /usr/share
    eval ${find_cmd} /var/log
    eval ${find_cmd} /var/tmp
    eval ${find_cmd} /tmp) | \
        rg -v '~$'| fzf --preview='[[ $(file --mime {}) =~ binary ]] &&
        echo {} is a binary file ||
        (highlight -O ansi -l {} ||
        cat {}) 2> /dev/null | head -500';)

    if [[ -n $file && (! $(file --mime $file) =~ 'binary') ]]
    then
        zle redisplay
        if [[ -w $file ]]
        then
            BUFFER="nvim '${file}'"
            zle accept-line
        else 
            BUFFER="sudo nvim '${file}'"
            zle accept-line
        fi
    else
        zle reset-prompt
    fi
}
zle -N edit-global-widget

kill-processes-widget() {
    zle kill-buffer
    local process=$(ps hc --ppid 2 -p 2 --deselect -o pid,user,args|fzf|awk '{print $1}')
    if [[ -n $process ]]
    then
        echo $process
    	zle redisplay
        BUFFER="sudo kill $process"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N kill-processes-widget


sudo-widget() {
    zle kill-buffer
    LBUFFER='sudo !!'
    zle expand-or-complete
    zle accept-line
}
zle -N sudo-widget

man-widget() {
    zle kill-buffer
    local manpage=$(fd -tf -e gz . /usr/share/man/ | sed 's/.*\///' | sed 's/\..*//' | sort -u |fzf --preview="whatis {}" --preview-window up:1)
    if [[ -n $manpage ]]
    then
        zle redisplay
        BUFFER="man $manpage"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N man-widget

ssh-widget() {
    zle kill-buffer
    local login=$(cat ~/.ssh/logins | fzf)
    if [[ -n $login ]]
    then
        zle redisplay
        BUFFER="ssh $login"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N ssh-widget

where-widget() {
    zle kill-buffer
    local name=$(
    (
    print -l ${(ok)commands}; 
    print -l ${(ok)builtins};
    print -l ${(ok)functions};
    print -l ${(ok)aliases}
    ) | fzf --preview="whatis {} 2> /dev/null && echo; where {} 2> /dev/null")
    if [[ -n $name ]]
    then
        zle redisplay
        where $name && whatis $name 2> /dev/null && pacman -Qo $(whereis -b $name|cut -d' ' -f2)
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N where-widget


## Keybindings

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

bindkey '^[s' sc-widget
bindkey '^[S' ssh-widget
bindkey '^[e' edit-local-widget
bindkey '^[E' edit-global-widget
bindkey '^[g' global-cd-widget
bindkey '^[k' kill-processes-widget
bindkey '^[i' insert-widget
bindkey '^[R' sudo-widget
bindkey '^[H' man-widget
bindkey '^U' parent-directory-widget
bindkey '^[W' where-widget

# fzf-widgets
bindkey '^[r' fzf-change-recent-directory

# Cycle dirstack, må være etter plugins
bindkey '^[P' insert-cycledleft
bindkey '^[N' insert-cycledright

# Alt-left, alt-right
bindkey ';3C' forward-word
bindkey ';3D' backward-word

# Ctrl-left, ctrl-right
bindkey ';5C' forward-word
bindkey ';5D' backward-word

# Ctrl-up,down, Alt-up,down
# Ser ikke ut til å fungere
bindkey ';3A' undefined-key
bindkey ';3B' undefined-key
bindkey ';5A' undefined-key
bindkey ';5B' undefined-key

# Taken by tmux prefix
bindkey '^S' undefined-key

bindkey '^[L' undefined-key
# bindkey '^[l' undefined-key
bindkey '^[l' clear-screen
bindkey '^Q' kill-buffer
bindkey '^[q' kill-buffer



# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files -uu'
export FZF_ALT_C_OPTS="--prompt='~/' --preview 'tree -C {} | head -200'"
export FZF_DEFAULT_OPTS='
--height=50% --reverse
--bind "tab:down,btab:up,ctrl-space:toggle+down,alt-q:abort,alt-n:down,alt-p:up,alt-j:down,alt-k:up"
--color fg:-1,bg:-1,bg+:-1'

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^[t' fzf-completion
bindkey '^I' $fzf_default_completion


#autonamedirs
setopt autonamedirs
dotfiles="/home/jonas/Dropbox/Backup/dotfiles"
