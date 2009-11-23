(setq load-path 
      (cons (concat (file-name-directory (or load-file-name buffer-file-name))
	      "org/lisp")
      load-path))
(setq load-path 
      (cons (concat (file-name-directory (or load-file-name buffer-file-name))
	      "org/contrib/lisp")
	      load-path)) 
(require 'org-install)


(provide 'starter-kit-org)
;; starter-kit-ork.el ends here
