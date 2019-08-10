;; add user modules to load path
(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))

(require 'prelude)

;; Set config sources
(setq user-config-file (from-userdir "vendor/user-config.el")
      user-config-source-file (from-userdir "vendor/user-config.org"))

;; Compile config if newer or non-existent
(when (file-newer-than-file-p user-config-source-file user-config-file)
  (require 'ob-tangle)
  (org-babel-tangle-file user-config-source-file user-config-file "emacs-lisp"))

;; Load config
(require 'user-config)
