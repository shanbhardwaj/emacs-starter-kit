;;; starter-kit-eshell.el --- Making the defaults a bit saner
;;
;; Part of the Emacs Starter Kit
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/eshell"))
;; (add-to-list 'load-path "/Users/shan/.emacs.d/emacs-starter-kit/vendor/eshell/")
;; (load "eshell-auto")
(require 'eshell)

(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (require 'eshell-vc)
     (setenv "PAGER" "cat")
     (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
     (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
	       '(lambda () (define-key eshell-mode-map "\M-p" 'eshell-bol)))
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
     (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)))

;;; Clear the elisp shell buffer.
(defun eshell/clear()
  (interactive)
  (recenter 0)
)

;;; Reset/erase the elisp buffer.
(defun eshell/reset()
  (interactive)
  (setq inhibit-read-only t)
  (erase-buffer)
)

(provide 'starter-kit-eshell)
;;; starter-kit-eshell.el ends here