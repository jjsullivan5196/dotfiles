(provide 'helpful)
;; helper-type utilities

(defun edit-user-config ()
  "Edit the main configuration file"
  (interactive)
  (display-buffer (find-file user-config-source-file)))

(defun config-reinit ()
  "Reload init.el"
  (interactive)
  (load (from-userdir "init.el")))
