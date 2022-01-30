(define-module (jsullivan guix-util)
  #:use-module (jsullivan util)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu services base)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public (shell-script name config script)
  "Gexp which will take CONFIG options for guile-config, and run SCRIPT with
options defined in %SCRIPT-OPTIONS."
  (define wrapper-script
    #~(begin
        (use-modules (config) (config api))

        (define %script-options
          (getopt-config-auto (configuration #$@config)
                              (command-line)))

        #$script))

  (program-file name
                (with-extensions (list guile-config)
                                 wrapper-script)))

(define-public (script-package name script)
  "Create a base package that installs SCRIPT as a program."
  (define bin-dir
    (file-union "bin" `((,name ,script))))

  (package
   (name name)
   (version "")
   (source #f)
   (build-system trivial-build-system)
   (arguments '(#:builder (begin (mkdir %output) #t)))
   (propagated-inputs (list bin-dir))
   (synopsis "")
   (description "")
   (home-page "")
   (license license:public-domain)))


(define-public (auto-login-to-tty config tty user)
  (if (string=? tty (mingetty-configuration-tty config))
      (mingetty-configuration
       (inherit config)
       (auto-login user))
      config))
