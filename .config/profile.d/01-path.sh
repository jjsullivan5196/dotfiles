source $HOME/.local/lib/scripts/util.sh

export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GRAALVM_HOME="$XDG_DATA_HOME/graalvm-ce-java11-20.2.0"
export CLOJURE_HOME="$XDG_DATA_HOME/clojure"
export DOTNET_ROOT="$HOME/.dotnet"

PATH=$(
  join_by ':' \
          "$HOME/.local/lib/scripts" \
          "$HOME/.local/bin" \
          "$XDG_DATA_HOME/dmenu" \
          "$JAVA_HOME/bin" \
          "$CLOJURE_HOME/bin" \
          "$HOME/.yarn/bin" \
          "$HOME/.config/composer/vendor/bin" \
          "$DOTNET_ROOT" \
          "$DOTNET_ROOT/tools" \
          "$GOPATH/bin" \
          "$PATH")
