export XDG_RUNTIME_DIR=$(${HOME}/.local/lib/scripts/xdg-runtime-dir)
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/password-store

export LESSHISTFILE=-
#export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
#export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc


export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NPM_CONFIG_USERCONFIG="XDG_CONFIG_HOME"/npm/npmrc
export npm_config_prefix="$HOME"/.local

export SSB_HOME="$XDG_DATA_HOME"/zoom
