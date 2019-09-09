if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    eval "$START_GUI"
fi
