LOCAL=$HOME/.local
SHARE=$LOCAL/share

export GRAALVM_HOME="$SHARE/graalvm-ce-java11-20.2.0"
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export DOTNET_ROOT="$HOME/.dotnet"

export PATH="$LOCAL/bin:$JAVA_HOME/bin:$SHARE/maven/bin:$SHARE/clojure/bin:$HOME/.yarn/bin:$HOME/.config/composer/vendor/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/go/bin:$PATH"
