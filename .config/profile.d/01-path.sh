source $HOME/.local/lib/scripts/util.sh

export GUILE_LOAD_PATH="$HOME/.local/lib/guile:$GUILE_LOAD_PATH"
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
