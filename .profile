# Root should inherit this environment as long as this user is logged in first
# May not work if logging in directly to root, but this is not a problem
# Even sudo inherits the variables
# sudo does inherit aliases, but not functions
# su gets aliases in zshrc (prob. because it is symlinked from root), but does not inherit aliases from this environment

# /etc/environment could be used if this method did not work
# /etc/profile also works, but belongs to filesystem package


# duplicates? maybe because zsh is used to run the profile on login?
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        # PATH="${PATH:+"$PATH:"}$1"
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
export JAVA_HOME=/usr/lib/jvm/default # Scala metals
export TERMGUICOLORS=1
