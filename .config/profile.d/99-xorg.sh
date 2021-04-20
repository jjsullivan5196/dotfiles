export XCURSOR_THEME=adwaita
export QT_STYLE_OVERRIDE=adwaita

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
 exec dbus-run-session sway
fi
