(define-module (jsullivan util)
  #:use-module (ice-9 match)
  #:use-module (ice-9 ftw)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-41)
  #:export (-> ->>))

;; Thread FORM as the second position of the following FORMS.
(define-syntax ->
  (syntax-rules ()
    ((-> form (first rest ...) forms ...)
     (-> (first form rest ...) forms ...))
    ((-> form first forms ...)
     (-> (first form) forms ...))
    ((-> form)
     form)))

;; Thread FORM as the last position of the following FORMS.
(define-syntax ->>
  (syntax-rules ()
    ((->> form (first rest ...) forms ...)
     (->> (first rest ... form) forms ...))
    ((->> forms ...)
     (-> forms ...))))

(define-public (plist-find key)
  "Create a function that finds the first KEY value in a plist."
  (define key? (cut equal? <> key))

  (define find-val
    (match-lambda
      (((= key? #t) val props ...) (list val))
      ((_k _v props ...) (find-val props))
      (_ '())))

  find-val)

(define-public (plist-get plist key)
  "Find the KEY value in PLIST if it exists."
  (define find-in (plist-find key))

  (find-in plist))

(define-public (stream-gen gen-proc done?)
  "Create a stream of elements from GEN-PROC that stops when DONE? is true."
  (stream-let
   recur ()
   (let [(g (gen-proc))]
     (if (done? g) stream-null
         (stream-cons g (recur))))))

#!;;testing

(plist-get '(#:foo bar #:baz qux) #:foo)

(empty? '())

port->stream

(with-input-from-file "/home/john/.config/emacs/init.el"
  (lambda ()
    (read)
    (read)
    (read)
    (read)
    (read)))

!#
