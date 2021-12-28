# Dump search paths
unset GUILE_LOAD_PATH
unset GUIX_PACKAGE_PATH
unset INFOPATH
unset EMACSLOADPATH

# System profile
. /etc/profile

# User profile
if [ -d $HOME/.config/profile.d ]; then
	for f in $HOME/.config/profile.d/*.sh; do
		[ -r "$f" ] && . "$f"
	done
	unset f
fi
