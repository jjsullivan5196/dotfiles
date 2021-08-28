export XINITRC=${XDG_CONFIG_HOME}/X11/xstart
export XSERVERRC=${XDG_CONFIG_HOME}/X11/xserverrc
export USERXSESSION=${XDG_CONFIG_HOME}/X11/xsession
export XAUTHORITY=${XDG_RUNTIME_DIR}/X11/Xauthority

[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit
