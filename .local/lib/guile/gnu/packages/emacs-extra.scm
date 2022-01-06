(define-module (gnu packages emacs-extra)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs)
  #:use-module (flat packages emacs)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public pgtk-emacs-next
  (package
   (inherit emacs-pgtk-native-comp)
   (name "pgtk-emacs-next")))

(define-public emacs-setup
  (package
   (name "emacs-setup")
   (version "1.2.0")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://elpa.gnu.org/packages/setup-"
           version
           ".tar"))
     (sha256
      (base32 "1fyzkm42gsvsjpk3vahfb7asfldarixm0wsw3g66q3ad0r7cbjnz"))))
   (build-system emacs-build-system)
   (home-page "https://git.sr.ht/~pkal/setup")
   (synopsis "Helpful Configuration Macro")
   (description
    "The `setup` macro simplifies repetitive configuration patterns, by providing
context-sensitive local macros in `setup' bodies.  These macros can be mixed
with regular elisp code without any issues, allowing for flexible and terse
configurations.  The list of local macros can be extended by the user via
`setup-define'.  A list of currently known local macros are documented in the
docstring for `setup'.

Examples and extended documentation can be found on Emacs wiki:
https://www.emacswiki.org/emacs/SetupEl.  Please feel free to contribute your
own local macros or ideas.")
   (license license:gpl3+)))

(define-public emacs-outline-magic
  (package
   (name "emacs-outline-magic")
   (version "20180619.1819")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tj64/outline-magic.git")
           (commit "2a5f07417b696cf7541d435c43bafcc64817636b")))
     (sha256
      (base32 "1iyslhk2zvhn4ip27apkjzkqw56lfakp2jzwz106jm45f3kllpc8"))))
   (build-system emacs-build-system)
   (home-page "unspecified")
   (synopsis "outline mode extensions for Emacs")
   (description
    "This package implements extensions for outline(-minor)-mode.")
   (license #f)))
