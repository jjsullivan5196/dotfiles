#!/bin/sh

# Run these programs on (graphical) startup

# compositing
compton -b &

# notifications
dunst &

# bar
polybar default &

# pidgin
pidgin &

# steam
steam -silent &
