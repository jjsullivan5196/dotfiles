#!/bin/sh

export SWAYSOCK=${XDG_RUNTIME_DIR}/sway-*.sock
HDMI_CONNECTED=`cat /sys/class/drm/card0-HDMI-A-1/status`

# Make sure sway is running
[ -e ${SWAYSOCK} ] || exit 0

# Check if HDMI is connected
if [ "${HDMI_CONNECTED}" = "connected" ]; then
  # Change display
  swaymsg output DSI-1 disable
  swaymsg output HDMI-A-1 enable

  # Change default audio sink
  pacmd 'set-default-sink 1'
else
  # Change display
  swaymsg output HDMI-A-1 disable
  swaymsg output DSI-1 enable

  # Change default audio sink
  pacmd 'set-default-sink 0'
fi
