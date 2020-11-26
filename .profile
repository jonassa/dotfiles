# Root should inherit this environment as long as this user is logged in first
# May not work if logging in directly to root, but this is not a problem (for normal use)
# Even sudo inherits the variables
# sudo does inherit aliases, but not functions
# su gets aliases in zshrc (because it is symlinked from root), but does not inherit aliases or functions

# /etc/environment could be used if this method did not work
# /etc/profile also works, but belongs to the filesystem package
# This method kinda doesn't work because root login shells don't get the variables

# So basically:
# su and sudo both inherit environment variables
# sudo also inherits aliases (from the environment, does not matter in practice)
# none of them inherit functions (from the environment)
# su gets aliases and functions from .zshrc, only because it is symlinked
# su - creates a login shell which inherits nothing (but .zshrc )
# neither sudo nor su -c 'command' are interactive, and so do not get any aliases or functions from .zshrc

# duplicates are not from here...
# stuff in /etc/profile.d...
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+$PATH:}$1"
    fi
}
pathadd "${HOME}/.local/bin"
pathadd "${HOME}/.npm-global/bin"
pathadd "${HOME}/.gem/ruby/2.5.0/bin"
pathadd "${HOME}/.cargo/bin"
pathadd "${HOME}/bin"
unset pathadd

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium
export SYSTEMD_PAGER=less
export SYSTEMD_EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/default # Scala metals (og andre ting som IntelliJ)

export XDG_CONFIG_HOME="$HOME/.config/"

export MOOD=dark; echo dark > /tmp/mood
export VIM_BG='dark'
# export VIM_COLORS='material-theme'

# Prettify python traceback (must install tbvaccine in virtualenv)
export TBVACCINE=1

# export LESS='-iRk /home/jonas/.less'
export LESS='-iRF -k /home/jonas/.less'
export NMON='MMMm1'
