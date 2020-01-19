export XORG_PROFILE="$HOME/.config/xprofile.d/bspwm.sh"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
