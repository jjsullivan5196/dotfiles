export ZDOTDIR="$HOME/.config/zsh"

# GUI Stuff
export XORG_WM=bspwm
export XORG_START="exec startx"

export START_GUI=$XORG_START

# Defaults
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="qutebrowser"
export DMENU_CMD='/usr/bin/dmenu'

# When stuff needs my githubz
export GHTOKEN=$(cat $HOME/.ghtoken)

# Path finagling
typeset -U PATH
PATH=($HOME/.gem/ruby/2.6.0/bin \
      $HOME/.local/bin \
      $HOME/.local/share/scala/dotty/bin \
      $HOME/.npm-global/bin \
      $HOME/.config/composer/vendor/bin \
      $PATH[@])
