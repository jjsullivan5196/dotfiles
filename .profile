# Load user profile
if [ -d $HOME/.config/profile.d ]; then
	for f in $HOME/.config/profile.d/*.sh; do
		[ -r "$f" ] && . "$f"
	done
	unset f
fi
