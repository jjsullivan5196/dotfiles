export XCURSOR_THEME=adwaita
export QT_STYLE_OVERRIDE=adwaita
#export MOZ_ENABLE_WAYLAND=1

[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit -- :1
