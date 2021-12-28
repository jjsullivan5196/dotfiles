(define-module (jsullivan emacs)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-41)
  #:use-module (jsullivan util))

(define ensured?
  ;; Check if use-package props already ensures this package is installed.
  (match-lambda
    ((= (plist-find ':straight) (not (? nil?))) #t)
    ((= (plist-find ':disabled) (not (? nil?))) #t)
    ((= (plist-find ':pin) '(manual)) #t)
    (_ #f)))

(define use-package->spec
  ;; Convert use-package format declaration to a guix package spec, returns #f
  ;; if no conversion exists.
  (match-lambda
    ((? (negate ensured?) ('use-package pkg-name props ...))
     (string-append "emacs-" (symbol->string pkg-name)))
    (_ #f)))

(define-public (init.el->specs init-file-path)
  "Turn an emacs init file into a list of package specs."
  (with-input-from-file init-file-path
    (lambda ()
      (let* [(init-exprs (stream-gen read eof-object?))
             (-specs     (stream-map use-package->spec init-exprs))
             (specs      (stream-filter identity -specs))]
        (stream->list specs)))))

#!;; Testing

(ensured? '(:straight (:recipe foo)))

(ensured? '(:pin manual))

(ensured? '(:pin foo))

(use-package->spec '(use-package foo
                                 :straight t))

(use-package->spec '(use-package bar))

(init.el->specs "/home/john/.config/emacs/init.el")

!#
