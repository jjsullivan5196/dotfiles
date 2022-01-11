(define-module (gnu services desktop-extra)
  #:use-module (gnu services)
  #:use-module (gnu services dbus)
  #:use-module (gnu system shadow)
  #:use-module (gnu system pam)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define polkit-wheel-nopass
  (file-union
   "polkit-wheel"
   `(("share/polkit-1/rules.d/01-wheel-nopass.rules"
      ,(plain-file
        "wheel-nopass.rules"
        "polkit.addRule(function(action, subject) {
    if(subject.isInGroup('wheel')) return polkit.Result.YES;
});
")))))

(define-public polkit-wheel-nopass-service
  (simple-service 'polkit-wheel-nopass polkit-service-type (list polkit-wheel-nopass)))
