#!/bin/sh

SHOW_KBD="busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true"
HIDE_KBD="busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b false"

exec lisgd \
  -d /dev/input/event4 \
  -g "3,DU,swaymsg exec '${SHOW_KBD}'" \
  -g "3,UD,swaymsg exec '${HIDE_KBD}'" \
  -g "2,ULDR,swaymsg exec 'bemenu-run'" \
  -g "3,RL,swaymsg workspace next" \
  -g "3,LR,swaymsg workspace prev" &
