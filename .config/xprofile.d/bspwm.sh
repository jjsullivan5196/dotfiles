polybar default &

sxhkd ~/.config/sxhkd/bspwm &

hsetroot -full ~/.wallpaper &

exec dbus-launch --exit-with-session bspwm
