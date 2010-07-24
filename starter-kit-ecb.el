;;CEDET, required for ECB
 (add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; Load CEDET
;; (load-file 
;;  (concat (file-name-directory (or load-file-name buffer-file-name))
;; 	 "/vendor/cedet/common/cedet.el"))

 ;; (load-file "/Users/shan/.emacs.d/emacs-starter-kit/vendor/cedet-1.0pre6/common/cedet.el")
;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features sumch as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

(setq semantic-load-turn-everything-on t)

;; (add-to-list 'load-path 
;;  (concat (file-name-directory (or load-file-name buffer-file-name))
;; 	 "/vendor/ecb"))
(add-to-list 'load-path "/Users/shan/.emacs.d/emacs-starter-kit/vendor/ecb-2.40/")
(require 'ecb)

(setq ecb-layout-name "left14")
(setq ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))
(setq ecb-options-version "2.40")
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-redraw-layout-quickly t)
(setq ecb-select-edit-window-on-redraw t)
(setq ecb-source-path (quote (("/Users/shan/projects/gigzee/web/gigzee/" "gigzee") ("/Users/shan/projects/" "projects"))))
(setq ecb-tip-of-the-day nil)

(provide 'starter-kit-ecb)