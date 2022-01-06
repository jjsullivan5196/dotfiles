# Dump search paths
unset GUILE_LOAD_PATH
unset GUIX_PACKAGE_PATH
unset INFOPATH
unset EMACSLOADPATH

# System profile
. /etc/profile

# Guix profile
GUIX_PROFILE="$HOME/.guix-profile"
. "${GUIX_PROFILE}/etc/profile"

export TERMINFO="${GUIX_PROFILE}/share/terminfo"

# Emacs
GUIX_PROFILE="$HOME/.config/emacs/init-package-profile"
. "${GUIX_PROFILE}/etc/profile"

# Current guix
GUIX_PROFILE="$HOME/.config/guix/current"
. "${GUIX_PROFILE}/etc/profile"

unset GUIX_PROFILE

# User profile
if [ -d $HOME/.config/profile.d ]; then
	for f in $HOME/.config/profile.d/*.sh; do
		[ -r "$f" ] && . "$f"
	done
	unset f
fi
