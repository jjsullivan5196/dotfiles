(define-module (gnu packages user)
  #:use-module (jsullivan guix-util)
  #:use-module (guix gexp)
  #:use-module (guix packages))


(define-public my-script-test
  (package
   (inherit (script-package "my-script-test"
                            (program-file "my-script-test"
                                          #~(display "hello world!"))))))
