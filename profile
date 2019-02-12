# /etc/profile

# Set our umask
umask 022

# Append our default paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath '/usr/local/sbin'
appendpath '/usr/local/bin'
appendpath '/usr/local/bin/scripts'
appendpath '/usr/bin'
# Jonas
appendpath "${HOME}/.local/bin"
NPM_PACKAGES="${HOME}/.npm-global"
appendpath "$NPM_PACKAGES/bin"
appendpath "/home/jonas/.gem/ruby/2.5.0/bin"
appendpath "/home/jonas/.cargo/bin"

unset appendpath
export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

# Jonas
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium
export SYSTEMD_PAGER=less
export SYSTEMD_EDITOR=nvim
