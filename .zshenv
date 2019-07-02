ZDOTDIR="$HOME/.config/zsh"
QT_QPA_PLATFORM=wayland-egl

# Defaults
EDITOR="nvim"
VISUAL="$EDITOR"
BROWSER="qutebrowser"

# When stuff needs my githubz
GHTOKEN=$(cat $HOME/.ghtoken)

# Path finagling
typeset -U path
path=($HOME/.gem/ruby/2.5.0/bin $HOME/.local/bin $HOME/.local/share/scala/dotty/bin $HOME/.npm-global/bin $path[@])
