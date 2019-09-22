export ZDOTDIR="$HOME/.config/zsh"

# GUI Stuff
export XORG_PROFILE="$HOME/.config/xprofile.d/bspwm.sh"
export START_GUI="exec startx"

# Defaults
export TERMINAL="emacsclient -a \"\" -nc -e '(eshell t)'"
export EDITOR="emacsclient -a \"\" -c"
export VISUAL="emacsclient -a \"\" -nc"
export BROWSER="qutebrowser"
export DMENU_CMD='/usr/bin/dmenu'

# When stuff needs my githubz
export GHTOKEN=$(cat $HOME/.ghtoken)

# Path finagling
typeset -U path
path=($HOME/.gem/ruby/2.6.0/bin \
      $HOME/.local/bin \
      $HOME/.local/share/scala/dotty/bin \
      $HOME/.npm-global/bin \
      $HOME/.config/composer/vendor/bin \
      $path[@])
