bindkey -e
ttyctl -f

export TERM=xterm-256color

# Use color names rather than escape codes
autoload -U colors && colors

# Sett LS_COLORS
# eval $(dircolors)
eval $(dircolors /home/jonas/.nord_dircolors)
export EXA_COLORS="di=1;34:ln=1;36:uu=0:gu=0:ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:su=0:sf=0:xa=0:da=0:sn=0:sb=0"

autoload -U select-word-style && select-word-style bash

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit

autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

autoload -U zmv

# Command-not-found
source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz run-help
alias help=run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# cdr: change to recent dir
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
chpwd() {
    emulate -L zsh
    ls -l
}

MOOD=$(</tmp/mood)

[[ $MOOD == 'light' ]] && alias fzf='fzf --color=light'

if [[ $MOOD == light ]]; then
    MAN_SOMETHING=red
    MAN_HEADER=black
    MAN_BOLD=green
else
    MAN_SOMETHING=red
    MAN_HEADER=white
    MAN_BOLD=green
fi

man() {
    env \
        LESS_TERMCAP_mb=$fg_bold[$MAN_SOMETHING]  \
        LESS_TERMCAP_md=$fg_bold[$MAN_HEADER] \
        LESS_TERMCAP_me=$reset_color \
        LESS_TERMCAP_se=$reset_color \
        LESS_TERMCAP_so=$fg_bold[$MAN_BOLD] \
        LESS_TERMCAP_ue=$reset_color \
        LESS_TERMCAP_us=$'\E[4;34m' \
        man "$@"
    }

manopt() {
  local cmd=$1 opt=$2
  [[ $opt == -* ]] || { (( ${#opt} == 1 )) && opt="-$opt" || opt="--$opt"; }
  man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
}

flag() {
    for f in "${@:2}"; do
        eval "$1 --help | grep '^\s*\-$f'"
    done
}

mg() {
    man $1 | less +"/\b$2\b"
}


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

# Hvis du vil rehashe completions automatisk (når nye pakker har blitt installert)
#zstyle ':completion:*' rehash true

# Menu-select completion
zstyle ':completion:*' menu select
# Nødvendig for å kunne binde til menuselect keymap
zmodload zsh/complist
# For å slippe to ganger enter
bindkey -M menuselect '^M' .accept-line
# For å gå inn i en mappe (accept completion)
bindkey -M menuselect '^[a' accept-search
# shift-tab
bindkey '^[[Z' reverse-menu-complete

# Instantly insert first completion (can be too aggressive)
setopt menucomplete
# This is default
setopt autolist

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
setopt promptsubst # expand variables in prompt (needed for some prompts)

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
# setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.

#for index ({1..9}) alias "$index"="cd +${index}"; unset index

# TODO: What is this for?
switch-to-dir () {
    [[ ${#dirstack} -eq 0 ]] && return

    while ! builtin pushd -q $1 &>/dev/null; do
        # We found a missing directory: pop it out of the dir stack
        builtin popd -q $1

        # Stop trying if there are no more directories in the dir stack
        [[ ${#dirstack} -eq 0 ]] && break
    done
}



## Aliases

alias sudo='sudo '

alias ls='ls -h --color=auto --group-directories-first --no-group'
alias l='ls -l'
alias ll='ls -la'
alias lh='ls -ld .?*'
alias ..='cd ..'
alias rd='rmdir'
alias mkd='md'
md() {
    mkdir -pv $1 && cd $1
}
take() {
  mkdir -p $@ && cd ${@:$#}
}
rn() {
    mv "$1" "${1:P:h}/$2"
}

alias exa='exa --group-directories-first'
alias lll='exa -lauUhmiHS --git'
alias lt='exa -lT'
alias ltt='exa -laT'
t() { exa -T --color always $@ | less}
t1() { exa -T -L1 --color always $@ | less}
t2() { exa -T -L2 --color always $@ | less}
t3() { exa -T -L3 --color always $@ | less}
tt() { exa -aT --color always $@ | less}
alias tree='tree -Chal --dirsfirst'

e() {
    if [[ -n $@ ]]; then
        echo $@
    else
        # local var=$( (env; declare -x; set) | sort -u | cut -d= -f1 | fzf)
        local var=$( declare | grep "^\S\+=" | cut -d= -f1 | fzf )
        eval echo \$$var
    fi
}
compdef _vars e

# alias wh='which'
alias p='print -l'
alias o='xdg-open'
alias x='atool -x'
alias h='history -nd -50'
alias hgrep='history -nd -10000|grep'
alias d='dirs -v'
alias lo='locate'
# alias u='cd ..'
siblings() {
    local target=$(command fd -d1 -td . .. --color=always | ag -v ${PWD:t} | fzf -1 -0 --ansi )
    [[ -n $target ]] && [[ -d $target ]] && cd "${target}"
}
# alias s='siblings'

alias ax='chmod +x'
alias bat='bat --theme ansi-dark'
alias cat='bat'
vsh(){
    if [[ -n $1 ]] && [[ ! -f $1 ]]; then
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
# function diff() {
#     diff -u "$1" "$2" | diffr
# }
alias grep='grep -i --color=auto'
alias fd='fd -H' # hidden
# alias ag='ag --color-path=0\;34 --color-line-number=0\;32 --color-match=1\;31'
# alias ag='ag --hidden --ignore .git'
agl() {ag $@ --pager less 2> /dev/null}
alias rg='rg -uuS' # hidden, ignored, smartcase
rgl() {rg $@ 2> /dev/null | less}
q() {[[ -n $@ ]] && ag $@ ~/Dropbox/Data}
alias udb='sudo updatedb'

alias term='xfce4-terminal'
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias svim='sudo nvim'
alias sv='sudo nvim'
alias em='emacsclient -c -a=""'
# alias tmp='vim $(mktemp -t scratchXXX)'
alias tmp='vim /tmp/scratch'
vimgrep() { vim -c "silent grep $@" }
alias vr='nvim ~/.config/nvim/init.vim'
alias z='nvim ~/.zshrc'
alias main='nvim ~/Dropbox/main.txt +"color tempus_past"'
alias notes='nvim ~/Dropbox/notes.txt +"color inkstained"'
CONFIG_FILES=(
    "$HOME/.zshrc"
    "$HOME/.profile"
    "$HOME/.config/nvim/init.vim"
    "$HOME/.config/xfce4/terminal/terminalrc"
    "$HOME/.config/kitty/kitty.conf"
    "$HOME/.config/alacritty/alacritty.yml"
)
alias conf='nvim $CONFIG_FILES'
alias bspconf='vim ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc'
alias cmd='nvim ~/Dropbox/Data/cmd/*'

tm() {
    if [[ -n $1 ]]; then
        tmux new -As $1
    else
        tmux
    fi
}
alias tl='tmux ls'
alias tk='tmux kill-session -t $(tmux list-sessions|fzf|cut -f1 -d:)'
alias tq='tmux kill-server'
ta() {
    if [[ -z $@ ]]; then
        local sessions=$(tmux list-sessions)
        [[ -n $sessions ]] && tmux attach -t $(fzf -1 <<< $sessions|cut -f1 -d:)
    else
        tmux attach -t $@
    fi
}

alias pm='pacman'
alias pa='yay'
alias pu='sudo pacman -Syu --noconfirm'
alias puu='yay'
# upgrade(){tmux new -s upgrade -c "sudo yay"}
# alias pd='pacman -Qqdt && sudo pacman -Rns $(pacman -Qqdt) || echo "There are no orphans to remove"'
alias pd='yay -c'
alias pls='yay -Ql'
alias pf='pacman -F'
alias po='pacman -Qo'
pt(){pactree $@}; compdef _pacman_installed_packages pt
ptgraph() {
    local graph=$(mktemp -t XXX.dot)
    pactree -g $@ > $graph
    xdot $graph 2> /dev/null &
}
deps() {pactree -d1 $@}; compdef _pacman_installed_packages deps
reqs() {pactree -rd1 $@}; compdef _pacman_installed_packages reqs
alias plog='paclog'
pl() {
    if [[ -n $@ ]]; then
        paclog --color --action all | ag --nocolor $@
    else
        paclog --action all
    fi
}

alias sc='sudo systemctl'
alias st='systemctl status'
alias se='sudo systemctl enable'
alias sd='sudo systemctl disable'
# alias sa 'sudo systemctl start'
# alias so 'sudo systemctl stop'
alias dmesg='dmesg -e --color=always' # human, no-pager, farger kan være problem men funker med grep og less
alias jc='journalctl'
alias pstree='pstree -hT' # highlight current process, hide threads

alias ip='ip -color'
alias ipp='ip -br addr && ip -br link'
alias ipinfo='http ipinfo.io || curl ipinfo.io'
i() {
    (
    echo "IP: $(ip -br addr | grep -E 'wlan|wlp' | f3)"
    echo "MAC: $(ip -br link | grep -E 'wlan|wlp' | f3)"
    echo "PUB: $(curl ifconfig.co 2> /dev/null)"
    ) | column -t
}
alias subnet='ip route | awk "END {print \$1}"'
alias df='df -hT' # human, show filesystem type; -a for all
alias dfc='dfc -T' # show type
alias cdu='cdu -is -dh &> /dev/null'
# function smem() {
#     (sudo smem -pt $@ | tail -n 1;
#     smem -kt $@) | command less
#     }
alias smem='sudo smem -kt' # -k abbreviate, -t show totals
alias pgrep='pgrep -ai' # show command, case insensitive
# alias pgrep='pgrep -li'  # show name, case insensitive
alias aria='aria2c'
alias sub='subliminal download -l en'
alias py='python'
alias py2='python2'
alias rsync='rsync -hP'

srv() {
    local ip="$(ip -br -4 addr show wlan0 | awk '{print $3}' | cut -d/ -f1):8000"
    echo $ip
    sed 's/\x1b\[[0-9;]*m//g' <<< $ip | xsel -ib 
    # xdg-open "http://$ip"
    if [[ -n $@ ]]; then
        python -m http.server --directory $@
    else
        python -m http.server
    fi
}

alias winelist='find .wine -name "*exe"|grep -v -e system32 -e syswow64 -e microsoft -e windows'
fontlist() {fc-list | awk -F: '{print $2,$3}' | sort -u}
alias fs='kitty @set-font-size'

dec(){
  echo "ibase=16; $@"|bc
}

hex(){
  echo "obase=16; $@"|bc
}

alias randpass='openssl rand -base64 12'
alias fkprint='lp -d fkprint -h printhost.samfundet.no'
alias webcam='mpv av://v4l2:/dev/video0'
alias li='light -S'

cl() {
    if [[ -n $@ ]]; then
        echo -n "$@" | xsel -b 
    else
        while read line; do echo "$line"; done | xsel -b
    fi
}
alias sel='fzf | xsel -ib'
alias hsel='history -n 0 |fzf --tac --no-sort|tr -d \\n|xsel -ib'


# Git
clone() {git clone $1 && cd $(basename $1 .git)}
alias g='git status -sb'
alias gg='git status'
alias ga='git add'
alias gb='git branch -avv'
alias grm='git remote -v'
alias gc='git checkout'
alias co='git checkout'
alias cm='git commit -v'
alias ca='git commit -av'
alias gd='git diff'
alias gdd='git diff --staged'
alias gds='git diff --stat'
alias gdds='git diff --staged --stat'
alias gdt='git difftool'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all --prune'
alias gm='git merge'
alias gpl='git pull'
alias gpu='git push'
alias gsh='git show'
alias gl='git log --oneline'
alias gll='git log --oneline --all'
alias glg='git log --graph --oneline --all'
alias gls='git log --stat'
alias glp='git log -p'
alias gwh='git whatchanged -p --abbrev-commit' 
alias gsb='git show-branch'
alias sw='git switch'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git restore'
alias grb='git rebase'
# alias gg='git pull --ff-only'
alias gst='git stash'
alias gsp='git stash pop'
alias gsl='git shortlog -n --no-merges'
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}
#todo: git extras has ignore command?
alias redit='vim $(git ls-tree --full-tree -r --name-only HEAD | fzf)'
alias gignore='vim $(git rev-parse --show-toplevel)/.gitignore'

alias perm='stat -c "%a %U"'

# Global aliases
alias -g G='|grep'
alias -g L='|less'
alias -g C='|wc -l'
alias -g DN='2> /dev/null'
alias -g H='--help'
alias -g F='|field'
alias -g R='; echo $?'
alias -g IMG='*.(jpg|jpeg|png|gif)'

alias nb='tmux new-session -d -s jupyter "jupyter lab"'

field() {
    awk "{print \$$1}"
}
for n in {1..9}; alias f$n="field $n"


## Functions

available() {
    command -v "$1" &> /dev/null
}

# TODO: does not work with aliases, should bypass the alias
executable() {
    [ -x "$(command -v $1)" ]
}

installed() {
    pacman -Q $@ &> /dev/null
}

in_git(){ git rev-parse --is-inside-work-tree >/dev/null; }

m() {PAGER="less -gs '+/^       "$2"'" man $1}

mykeys() {
    ag '^bindkey' --nocolor --nonumbers ~/.zshrc --color;
}

bspkeys() {
    cat ~/.config/sxhkd/sxhkdrc | awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' | column -t -s $'\t' | fzf
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


# TODO: update pr, pg, pq to use xargs like this
pi() {
    if [[ -n $@ ]]; then
        # result=$(comm -23 <(pacaur -Ssq $@|sort) <(pacman -Qq|sort) | fzf --preview 'pacaur -Si {}')
        yay -S $@
    else
        # result=$(comm -23 \
        # <((
        # curl https://aur.archlinux.org/packages.gz -o - 2> /dev/null | zcat;
        # pacman -Slq;
        #     )|sort) \
        # <(pacman -Qq|sort) \
        # | fzf --preview 'yay -Si {}')
        yay -Pc | field 1 | fzf --preview 'yay -Si {}' | xargs -ro yay -S
    fi
    # if [[ -n $result ]]; then
    #     yay -S $result
    # fi
}

pg() {
    if [[ -n $@ ]]; then
        result=$(yay -Ssq $@ | fzf --preview 'yay -Si {}')
    else
        # result=$( \
        #     (
        #     curl https://aur.archlinux.org/packages.gz -o - 2> /dev/null | zcat;
        #     pacman -Slq;
        #     ) | sort | fzf --preview 'yay -Si {}')
        result=$( yay -Pc | field 1 | sort | fzf --preview 'yay -Si {}')
    fi
    yay -Si $result
}

pq() {
    if [[ -n $@ ]]; then
        yay -Qi $@
        pacman -Ql $@ | grep --color=never "/usr/bin/" | tail +2
    else
        result=$(pacman -Qq | fzf --preview 'pacman -Qi {}')
        if [[ -n $result ]]; then
            yay -Qi $result
            pacman -Ql $result | grep --color=never "/usr/bin/" | tail +2
        fi
    fi
}
compdef _pacman_installed_packages pq

pr() {
    if [[ -n $@ ]]; then
        sudo pacman -Rns $@
    else
        result=$(pacman -Qq | fzf --preview 'pacman -Qi {}')
        [[ -n $result ]] && sudo pacman -Rns $result
    fi

}
compdef _pacman_installed_packages pr

ali() {
    local cmd=$(alias|fzf|cut -d\' -f2)
    if [[ -n $cmd ]]; then
        echo $cmd
        eval $cmd
    fi
}


psq() {
    local pid=$(ps -e hc -o pid,user,args|fzf|awk '{print $1}')
    if [[ -n $pid ]]; then
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
    local url=$(yay -Qi `pacman -Qq|fzf` | rg '^URL'|awk '{print $3}')
    test -n $url && xdg-open "${url}" &> /dev/null
}

ap() {
    local file=$(rg --files -uu --no-messages | sed 's/^\/home\/jonas\///' | sed '/~$/d' | fzf --prompt='~/' \
        --preview='[[ $(file --mime {}) =~ binary ]] &&
        echo {} is a binary file ||
        (highlight -O ansi -l {} ||
        cat {}) 2> /dev/null | head -500'
    )
    if [[ -n $file ]]; then
        file=$(realpath $file)
        if [[ $(file --mime $file) != *"binary"* ]]; then
            echo "\n$@" >> $file
        else
            echo "Binary file, nothing appended"
            return 1
        fi
    else
        return 1
    fi

}

wh() {
    type=$(type $1)
    case $type in
        *alias*)
            command -v $1
            ;;
        *function*)
            echo -n $fg_bold[green]
            type $1
            echo $reset_color
            which $1
            ;;
        *builtin*)
            type $1
            man $1 || apropos -e $1
            ;;
        *reserved*)
            type $1
            ;;
        *not\ found*)
            type $1
            ;;
        *)
            echo -n $fg_bold[green]
            command -v $1
            echo -n $reset_color
            file $(command -v $1)
            pacman -Qo $1
            if [[ $? == 0 ]]; then
                pactree -d1 $(pacman -Qqo $1)
                whereis $1
            fi
    esac
}


## PLUGIN LOAD
# Dynamic
source <(antibody init)
antibody bundle < ~/.zshplugins

# Static
# antibody bundle < ~/.zplugins.txt > ~/.zplugins.sh
# source .zplugins.sh


## Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets line)
ZSH_HIGHLIGHT_STYLES[path]=none


## WIDGETS

# Don't insert tab on an empty line
expand-or-complete-or-list-files() {
    if [[ $#BUFFER == 0 ]]; then
        ls -l
        zle accept-line
    else
        zle expand-or-complete
    fi
}
zle -N expand-or-complete-or-list-files
bindkey '^I' expand-or-complete-or-list-files

fancy-ctrl-z() {
    fg
    zle accept-line
    # zle push-input
    # zle clear-screen
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

_systemd_units() {
    zle kill-buffer
    local service=$(systemctl list-unit-files --no-pager| cut -d' ' -f1| tail -n +2 | head -n -2| sed '/^-/d' | rg -v @ | fzf --preview="systemctl status -n0 {}");
    if [[ -n $service ]]; then
        zle redisplay
        systemctl status --no-pager $service
        zle accept-line
        local action=$(echo "cat\nshow\nenable\ndisable\nstart\nstop\nrestart\nreload"|fzf)
        if [[ -n $action ]]; then
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
zle -N _systemd_units

_global_dirs() {
    zle kill-buffer
    local dir="$(locate -0 / | grep -z -vE '~$' | fzf --read0 -0 -1 --preview 'tree -C {} | head -200')"
    if [[ -n $dir ]]; then
        if [[ -d $dir ]]; then
            cd -- "$dir"
        else
            cd -- "${dir:h}"
        fi
    else
        zle redisplay
    fi
    # Last two lines dont show in multiline prompts
    printf '\n\n'
    zle fzf-redraw-prompt
    zle reset-prompt
}
zle -N _global_dirs

_locate_insert() {
    local target="$(locate -0 / | grep -z -vE '~$' | fzf --read0 -0 -1 --preview 'tree -C {} | head -200')"
    if [[ -n $target ]]; then
        LBUFFER+="\"$target\" "
        zle redisplay
    else
        zle redisplay
    fi
}
zle -N _locate_insert

_local_files() {
    zle kill-buffer
    # rg is faster at listing files than fd
    # print **/* (zsh native) is almost as fast?
    # print **/*(.) (for bare filer) er mye tregere enn qualifier
    # bør bruke rg --files -uu og fallback til find -type f
    # EDIT: find -type f er raskere enn rg

    # file=$(fd -H -tf -c never . ~ | rg -v '~$' | fzf --preview="head {}")
    # file=$(print -l **/* | sed '/~$/d' | fzf --prompt='./' --ansi --preview 'bat --color=always --style=header,grid --line-range :300 {}')

    # Using highlight
    # local file=$(rg --files --no-messages --no-follow -uu | sed '/~$/d' | fzf --prompt='./' \
    #     --preview='[[ $(file -b --mime {}) =~ binary ]] &&
    #     file -b {} ||
    #     (highlight -O ansi -l {} ||
    #     cat {}) 2> /dev/null | head -500'
    #     )

    # Using bat
    local file=$(rg --files -uu --no-messages --no-follow | sed '/~$/d' | fzf --prompt='./' --ansi --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    if [[ -n $file ]]; then
        # file=$(realpath $file)
        zle redisplay
        if [[ ! $(file --mime $file) =~ 'binary' ]]; then
            BUFFER="vim \"${file}\""
            zle accept-line
        fi
    else
        zle reset-prompt
    fi
}
zle -N _local_files

_dotfiles() {
    local file=$(rg --files -uu --no-messages --no-follow $dotfiles | sed '/~$/d' | grep -v "\.git" |\
        while read -r line; do
            realpath --relative-to=$dotfiles $line
        done |\
        fzf --prompt='dotfiles/' --ansi --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    if [[ -n $file ]]; then
        file="$dotfiles/$file"
        zle redisplay
        BUFFER="vim \"${file}\""
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N _dotfiles

_wiki_files() {
    local file=$(\
        rg --files -g '*.txt' -g '*.md' --no-messages --no-follow ~/Dropbox |\
        sed '/~$/d' | grep -v -e "\.git" -e "reaper" |\
        while read -r line; do
            realpath --relative-to="$HOME/Dropbox" $line
        done |\
        fzf --prompt='Dropbox/' --ansi --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    if [[ -n $file ]]; then
        file="$HOME/Dropbox/$file"
        zle redisplay
        BUFFER="vim \"${file}\""
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N _wiki_files


# locate -0 -r ^/etc -r ^/usr/lib -r ^/usr/local -r ^/usr/share -r /home/jonas
# TODO: doesn't work
# _system_files() {
#     zle kill-buffer
#     find_cmd="rg --files -uu --no-messages"
#     # find_cmd="find -type f" 
#     local file=$(
#     (eval $find_cmd /etc
#     eval $find_cmd ~/
#     eval $find_cmd /usr/lib
#     eval $find_cmd /usr/local
#     eval $find_cmd /usr/share
#     eval $find_cmd /var/log
#     eval $find_cmd /var/tmp
#     eval $find_cmd /tmp) | grep -v '~$'| fzf)
#         # rg -v '~$'| fzf --preview='[[ $(file --mime {}) =~ binary ]] &&
#         # echo {} is a binary file ||
#         # (highlight -O ansi -l {} ||
#         # cat {}) 2> /dev/null | head -500';)

#     if [[ -n $file && (! $(file --mime $file) =~ 'binary') ]]; then
#         zle redisplay
#         if [[ -w $file ]]; then
#             BUFFER="nvim '${file}'"
#             zle accept-line
#         else 
#             BUFFER="sudo nvim '${file}'"
#             zle accept-line
#         fi
#     else
#         zle reset-prompt
#     fi
# }
# zle -N _system_files


GLOBAL_DIRS=(
    "/etc"
    "/usr/lib"
    "/usr/local"
    "/usr/share"
    "/var/log"
    "/var/tmp"
    "/tmp"
)

_system_files() {
    zle kill-buffer
    # local file=$(find $GLOBAL_DIRS -type f  2> /dev/null | grep -v '~$' | fzf)
    local file=$(rg --files --no-messages $GLOBAL_DIRS | grep -v '~$' | fzf)
    if [[ -n $file && (! $(file --mime $file) =~ 'binary') ]]; then
        zle redisplay
        if [[ -w $file ]]; then
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
zle -N _system_files


gp() {
    local project=$(
    locate -r "\.git$" | grep -v -e '\.cache' -e '\.vim' -e '\.tmux' -e '\.cargo' \
    | while read -r proj; do
        realpath --relative-to=$HOME $(dirname $proj)
    done | fzf)
    [[ -n $project ]] && cd ~/$project
}

pe() {
    pfile=$(find .password-store/ -type f | while read -r line; do realpath --relative-to=".password-store" $line ;done | fzf)
    [[ -n $pfile ]] && pass edit $pfile:r
}

_kill_process() {
    zle kill-buffer
    local process=$(ps -N --ppid 2 -p 2 -o s,user,pid,pcpu,pmem,comm --sort -pcpu,-pmem | fzf --header-lines=1 | awk '{print $3}')
    if [[ -n $process ]]; then
        echo $process
        zle redisplay
        kill $process 2> /dev/null || sudo kill $process
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N _kill_process


_resudo() {
    zle kill-buffer
    LBUFFER='!!'
    zle expand-or-complete
    if [[ $LBUFFER =~ '^sudo' ]]; then
        zle accept-line
    else
        LBUFFER='sudo !!'
    zle expand-or-complete
        zle accept-line
    fi
}
zle -N _resudo

_repeat() {
    zle kill-buffer
    BUFFER='!!'
    zle expand-or-complete
    zle accept-line
}
zle -N _repeat

_manpages() {
    zle kill-buffer
    local manpage=$(fd -tf -e gz . /usr/share/man/ | sed 's/.*\///' | sed 's/\..*//' | sort -u |fzf --preview="whatis {}" --preview-window up:1)
    if [[ -n $manpage ]]; then
        zle redisplay
        BUFFER="man $manpage"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N _manpages

_ssh_targets() {
    zle kill-buffer
    local login=$(cat ~/.ssh/logins | fzf)
    if [[ -n $login ]]; then
        zle redisplay
        BUFFER="ssh $login"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N _ssh_targets

_where() {
    zle kill-buffer
    local name=$(
    (
    print -l ${(ok)commands}; 
    print -l ${(ok)builtins};
    print -l ${(ok)functions};
    print -l ${(ok)aliases}
    ) | fzf --preview="whatis {} 2> /dev/null && echo; where {} 2> /dev/null")
    if [[ -n $name ]]; then
        zle redisplay
        type -as $name && whatis $name 2> /dev/null && pacman -Qo $(whereis -b $name|cut -d' ' -f2)
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N _where

_parent_dir() {
    cd ..
    zle kill-buffer
    zle accept-line
}
zle -N _parent_dir

_oldcd() {
    cd -
    zle kill-buffer
    zle accept-line
}
zle -N _oldcd

_popd() {
    popd
    zle kill-buffer
    zle accept-line
}
zle -N _popd

_run() {
    local file=$(fd -tx -d1 | fzf -0 -1)
    if [[ -n $file ]]; then
        LBUFFER="./$file "
        zle redisplay
    else
        zle redisplay
    fi
}
zle -N _run

## Keybindings

# Up, Down
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Alt-left, Alt-right
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# Ctrl-left, Ctrl-right
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Alt-n/p to Ctrl-n/p
bindkey '^[p' up-history
bindkey '^[n' down-history

# riktige er riktige, men undefined-key gjør ikke det du vil
# Ctrl-up,down, Alt-up,down
bindkey '^[[1;3A' _parent_dir
bindkey '^[[1;3B' undefined-key
bindkey '^[[1;5A' undefined-key
bindkey '^[[1;5B' undefined-key

# Home, End
bindkey '[H' beginning-of-line
bindkey '[F' end-of-line

bindkey '^[q' kill-buffer
bindkey '^Q' push-line-or-edit
bindkey '^[l' clear-screen
bindkey '^[u' undo
bindkey '^[U' redo
bindkey ' ' magic-space
# Alt-¨: insert ~/
bindkey -s ']' '~/'
# Ctrl-space 
bindkey '^@' autosuggest-accept
bindkey "^[m" copy-prev-shell-word
# bindkey "^[w" backward-kill-word

bindkey '^[e' _local_files
bindkey '^[D' _dotfiles
bindkey '^[W' _wiki_files
bindkey '^[E' _system_files
bindkey '^[g' _global_dirs
bindkey '^[i' _locate_insert
bindkey '^[k' _kill_process
bindkey '^[s' _systemd_units
bindkey '^[S' _ssh_targets
bindkey '^[H' _manpages
# bindkey '^[W' _where

bindkey '^[r' _resudo
bindkey '^[a' _repeat
bindkey '^U'  _parent_dir
bindkey '^[-' _oldcd
bindkey 'o' _popd
# bindkey -s 'o' 'popd\r'
bindkey 'w' _run

bindkey -s ß /
bindkey -s ð ~/
bindkey -s π ../
bindkey -s œ 'xdg-open .\r'


# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='find -type f'
# export FZF_DEFAULT_COMMAND='rg --files -uu'
export FZF_ALT_C_COMMAND="fd -H -td -tl"
# Find is faster, but sorts depth first
# export FZF_ALT_C_COMMAND="find -type d -or -type l"
export FZF_ALT_C_OPTS="--prompt='./' --preview 'tree -C {} | head -200'"
export FZF_DEFAULT_OPTS="
    --height=35% --reverse --inline-info
    --bind 'tab:down,btab:up,ctrl-space:toggle+down,alt-q:abort,alt-n:down,alt-p:up,alt-j:down,alt-k:up'
    --color fg:-1,bg:-1,bg+:-1
"
# Using bat instead of highlight for file preview
# --ansi --preview 'bat --color=always --style=header,grid --line-range :300 {}'

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^[t' fzf-completion
bindkey '^I' $fzf_default_completion

setopt autonamedirs
dotfiles="/home/jonas/Dropbox/Backup/dotfiles"
Fag="/home/jonas/Dropbox/Fag"

# FASD
eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
bindkey '^X' fasd-complete

v() {
    if [[ -n $@ ]]; then
        local file=$(fasd -f $@)
        [[ -n $file ]] && vim "${file}"
    else
        local file=$(fasd -ftlR | fzf --no-sort --tiebreak=index)
        [[ -n $file ]] && vim "${file}"
    fi
}
c() {
    if [[ -n $@ ]]; then
        local dir=$(fasd -d $@)
        [[ -n $dir ]] && cd "${dir}"
    else
        local dir=$(fasd -dtlR | fzf --no-sort --tiebreak=index)
        [[ -n $dir ]] && cd "${dir}"
    fi
}


# vg() {
#     if [[ -z $@ ]]; then
#         return
#     fi
#     local file=$(command rg -l -uu "$@" 2> /dev/null | fzf --preview="rg --color=always -C3 \"${@}\" {}");
#     if [[ -n $file ]]; then
#         local line=$(rg -n "$@" "${file}" | head -n1 | cut -d: -f1)
#         vim +$line "${file}"
#     fi
# }

# Bedre versjon av vg (bruker highlight og ikke bat til preview)
# TODO: skriv om til å bruke bat, og go to line (to søk eller inkludert i fzf input)
va() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  local file=$(rg -l --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
  [[ -n $file ]] && vim "${file}"
}

vf() {
    local file=$(fd -tf "$@" | fzf --preview "echo {} | rg --color=always \"$@\"" --preview-window up:1);
    [[ -n $file ]] && vim "${file}"
}

ff() {
    local target=$(fd "$@" | fzf)
    xdg-open "$target" &
}


# COMPLETION PROVIDERS
_pacman_installed_packages() {
	local -a cmd packages packages_long
	packages_long=(/var/lib/pacman/local/*(/))
	packages=( ${${packages_long#/var/lib/pacman/local/}%-*-*} )
	compadd "$@" -a packages
}

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
# eval "$(/home/jonas/anaconda3/bin/conda shell.zsh hook)"
eval "$(/opt/miniconda3/bin/conda shell.zsh hook)"

# quickfix: gnome does not add this path, though .profile is sourced
# export PATH="${PATH:+$PATH:}$HOME/bin"


# TODO: m-r to repeat command, m-R to sudo repeat
# TODO: m-j (jump? down?), m-k (C-K?), m-v
# TODO: m-w to kill a word!
# TODO: something to git switch fzf? or just make g take an argument with completion
# TODO: <m-m> is copy last word, rarely useful
# TODO: something easier than c-a; m-a (accept and hold) is kind of nice
# TODO: <c-x> should be something other than fasd complete (but is used by tmux)
# TODO: something to grep last command
# TODO: ./ og ../
# TODO!!: widget for å kopiere BUFFER til clipboard (cl "")
# TODO: edit dotfile under Dotfiles
# ting som er dritt å skrive:
    # ~/
    # ./
    # ../
