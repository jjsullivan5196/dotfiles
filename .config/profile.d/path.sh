LOCAL=$HOME/.local
SHARE=$LOCAL/share

# JAVA
export JAVA_HOME=$SHARE/jdk/jdk-11.0.4+11

# Droid
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

# Path finagling
EXTPATH=($JAVA_HOME/bin \
         $ANDROID_SDK_ROOT/tools \
         $ANDROID_SDK_ROOT/platform-tools \
         $SHARE/android-studio/bin \
         $SHARE/scala/dotty/bin \
         $SHARE/Discord \
         $LOCAL/bin \
         $HOME/.npm-global/bin \
         $HOME/.gem/ruby/2.6.0/bin \
         $HOME/.config/composer/vendor/bin)

export PATH=$(printf "%s:" ${EXTPATH[@]} $PATH)
