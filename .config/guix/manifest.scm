(use-modules (gnu packages)
             (jsullivan emacs))

(define emacs-init
  (string-append (getenv "XDG_CONFIG_HOME") "/emacs/init.el"))

(specifications->manifest
 (append
  (list
;; * GUI stuff
   "sway"
   "swayidle"
   "xorg-server-xwayland"
   "bemenu"
   "i3blocks"
   "slurp"
   "grim"
;; * Fonts
   "font-dejavu"
   "font-hack"
   "font-google-noto"
;; * Internet
   "icecat"
;; * Documents
   "ghostscript"
   "zathura"
   "xournalpp"
   "tesseract-ocr"
;; * Multimedia
   "pipewire"
   "alsa-ucm-conf"
   "wireplumber"
   "pamixer"
   "pavucontrol"
   "imv"
   "mpv"
   "gimp"
   "inkscape"
   "darktable"
;; * Tools
   "p7zip"
   "udisks"
   "dbus"
;; * Programming
   "guile"
   "guix")
;; * Emacs
  (cons*
   "emacs"
   "emacs-use-package"
   "emacs-guix"
   (init.el->specs emacs-init))))
