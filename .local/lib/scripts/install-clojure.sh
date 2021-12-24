#!/usr/bin/env sh

CLJ_VERSION="1.10.3.1040"
INSTALL_SCRIPT_URI="https://download.clojure.org/install/linux-install-${CLJ_VERSION}.sh"

curl -o /tmp/clj-installer.sh "${INSTALL_SCRIPT_URI}"
chmod +x /tmp/clj-installer.sh
/tmp/clj-installer.sh --prefix ${XDG_DATA_HOME}/clojure
