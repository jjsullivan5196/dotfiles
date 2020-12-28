LOCAL=$HOME/.local
SHARE=$LOCAL/share

export GRAALVM_HOME="$SHARE/graalvm-ce-java11-20.2.0"
export JAVA_HOME=${GRAALVM_HOME}

export PATH="$PATH:$LOCAL/bin:$JAVA_HOME/bin:$SHARE/maven/bin:$SHARE/clojure/bin:$HOME/.yarn/bin:$HOME/.config/composer/vendor/bin"
