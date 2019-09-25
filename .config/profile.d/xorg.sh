export XORG_PROFILE="$HOME/.config/xprofile.d/bspwm.sh"
export QT_STYLE_OVERRIDE=adwaita

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
