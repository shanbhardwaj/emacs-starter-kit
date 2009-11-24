(eval-when-compile
  (require 'color-theme))

(defun color-theme-example ()
  "Example theme. Carbon copy of color-theme-gnome contributed by Jonadab."
  (interactive)
  (color-theme-install
   '(color-theme-example
     ((foreground-color . "wheat")
      (background-color . "black")
      (background-mode . dark))
     (default ((t (nil))))
     (region ((t (:foreground "cyan" :background "dark cyan"))))
     (underline ((t (:foreground "yellow" :underline t))))
	     (font-lock-builtin-face ((t (:foreground "#aaccff")))) 
	     (font-lock-comment-face ((t (:italic t :foreground "#9933cc")))) 
	     (font-lock-comment-delimiter-face ((t (:foreground "#9933cc")))) 
	     (font-lock-constant-face ((t (:foreground "#339999")))) 
	     (font-lock-function-name-face ((t (:foreground "#ffcc00")))) 
	     (font-lock-keyword-face ((t (:foreground "#ff6600")))) 
	     (font-lock-preprocessor-face ((t (:foreground "#aaffff")))) 
	     (font-lock-reference-face ((t (:foreground "LightSteelBlue")))) 
	     (font-lock-string-face ((t (:foreground "#66FF00")))) 
	     (font-lock-doc-face ((t (:foreground "LightSalmon")))) 
	     (font-lock-type-face ((t (:foreground "#FFFFFF")))) 
	     (font-lock-variable-name-face ((t (:foreground "#FFFFFF")))) 
	     (font-lock-warning-face ((t (:bold t :foreground "Pink")))) 
	     (paren-face-match-light ((t (:background "#222222")))) 
	     (highlight ((t (:background "darkolivegreen")))) 
	     (italic ((t (:italic t)))) 
	     (modeline ((t (:background "#444444" :foreground "black")))) 
	     (modeline-buffer-id ((t (:background "#444444" :foreground 
	"black")))) 
	     (modeline-mousable ((t (:background "#444444" :foreground 
	"black")))) 
	     (modeline-mousable-minor-mode ((t (:background 
	"#444444" :foreground "black")))) 

     (italic ((t (:foreground "dark red" :italic t))))
     (bold-italic ((t (:foreground "dark red" :bold t :italic t))))
     (font-lock-comment-face ((t (:foreground "Firebrick"))))
     (bold ((t (:bold)))))))
