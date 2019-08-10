(provide 'prelude)
;; dependency-free utility functions

(defun from-userdir (path)
  "Expand relative PATH from `user-emacs-directory`"
  (expand-file-name path user-emacs-directory))
