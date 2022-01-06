source $HOME/.local/lib/scripts/util.sh

GUILE_LOCAL_HOME="$HOME/.local/lib/guile"
export GUILE_LOAD_PATH="$GUILE_LOCAL_HOME:$GUILE_LOAD_PATH"
export GUIX_PACKAGE_PATH="$GUILE_LOCAL_HOME:$GUIX_PACKAGE_PATH"
export CLOJURE_HOME="$XDG_DATA_HOME/clojure"
export DOTNET_ROOT="$HOME/.dotnet"

export PATH=$(
  join_by ':' \
          "$HOME/.local/lib/scripts" \
          "$HOME/.local/bin" \
          "$XDG_DATA_HOME/dmenu" \
          "$XDG_DATA_HOME/flatpak/exports/bin" \
          "$CLOJURE_HOME/bin" \
          "$HOME/.yarn/bin" \
          "$HOME/.config/composer/vendor/bin" \
          "$DOTNET_ROOT" \
          "$DOTNET_ROOT/tools" \
          "$GOPATH/bin" \
          "$PATH")
