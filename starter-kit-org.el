(setq load-path 
      (cons (concat (file-name-directory (or load-file-name buffer-file-name))
	      "org/lisp")
      load-path))
(setq load-path 
      (cons (concat (file-name-directory (or load-file-name buffer-file-name))
	      "org/contrib/lisp")
	      load-path)) 
(require 'org-install)

(require 'org)
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
 (add-to-list 'auto-mode-alist '("\\.\\(org_archive\\|txt\\)$" . org-mode))
 (add-to-list 'auto-mode-alist '("README$" . org-mode))	
 (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cb" 'org-iswitchb)
 (global-set-key (kbd "M-m") 'org-remember)
 (global-set-key [f12] 'org-agenda)

(setq diary-file "~/org/diary")
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd "C-.") 'org-agenda)
(setq mark-diary-entries-in-calendar t)
(setq org-agenda-files (quote (	"~/org/gigzee.org" 
								"~/org/unscrewed.org"  
								"~/org/todo.org"  
								"~/org/refile.org"
								"~/org/journal.org")))

(setq org-default-notes-file "~/org/refile.org")

(setq org-todo-keywords (quote 
			((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
 			(sequence "WAITING(w@/!)" "SOMEDAY(S!)" "OPEN(O@)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces (quote 
								(("TODO" :foreground "red" :weight bold)
                                 ("STARTED" :foreground "blue" :weight bold)
                                 ("WAITING" :foreground "orange" :weight bold)
                                 ("SOMEDAY" :foreground "magenta" :weight bold)
                                 ("APPT" :foreground "orange" :weight bold)
                                 ("DONE" :foreground "green" :weight bold))))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; add tags on state changes, used for agenda views
(setq org-todo-state-tags-triggers (quote (("CANCELLED" ("CANCELLED" . t))
                                           ("WAITING" ("WAITING" . t) ("NEXT"))
                                           ("SOMEDAY" ("WAITING" . t))
                                           (done ("NEXT") ("WAITING"))
                                           ("TODO" ("WAITING") ("CANCELLED"))
                                           ("STARTED" ("WAITING" . t)))))

(setq org-combined-agenda-icalendar-file "~/Sites/cal/org.ics")
(setq org-icalendar-include-todo t)
(setq org-icalendar-combined-name (quote "Shan ORG"))
(setq org-icalendar-use-scheduled '(todo-due  event-if-todo event-if-not-todo))
(setq org-icalendar-use-deadline '(todo-due event-if-todo event-if-not-todo))
(setq org-icalendar-timezone "PST")
;;(setq org-icalendar-include-bbdb-anniversaries t)
(setq org-icalendar-store-UID t)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)    ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

; Use IDO for target completion
(setq org-completion-use-ido t)

; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))

; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

(setq org-deadline-warning-days 8)

(setq org-fast-tag-selection-single-key t)


(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(setq org-log-done t)

;;=================================
;; Remember mode
;;=================================
(require 'remember)
;;(require 'remember-autoloads)
(org-remember-insinuate)
;;(add-to-list 'load-path (concat dotfiles-dir "/vendor/remember"))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

;; C-c C-c stores the note immediately
(setq org-remember-store-without-prompt t)

;; I don't use this -- but set it in case I forget to specify a location in a future template
(setq org-remember-default-headline "Tasks")

(setq org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} \n%?Added: %U" "~/org/refile.org" "Tasks")
        ("Note" ?n "* NOTE: \tAdded: %U %^{Brief Description} %^g\n%?" "~/org/refile.org" bottom nil)
        ("Idea" ?i "* IDEA %^{Title}\n  %u\n %i\n " "~/org/journal.org" "New Ideas")))

;; refile tasks 

(setq org-agenda-custom-commands
      (quote (("s" "Started Tasks" todo "STARTED" ((org-agenda-todo-ignore-with-date nil)))
              ("w" "Tasks waiting on something" tags "WAITING" ((org-use-tag-inheritance nil)))
              ("r" "Refile New Notes and Tasks" tags "REFILE" ((org-agenda-todo-ignore-with-date nil)))
              ("n" "Notes" tags "NOTES" nil))))

; Tags with fast selection keys
(setq org-tag-alist   '(("CODE" . c?)
                        ("PHONE" . ?p)
                        ("ERRAND" . ?e)
                        ("THINK" . ?t)
                        ("REFILE" . ?r)))
;; (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))
; Tags with fast selection keys
; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))
(setq org-agenda-include-diary t)
(setq org-recursive-checkbox-statistics t)
(setq org-agenda-dim-blocked-tasks t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-completion-use-ido t)
(setq org-reverse-note-order)

(add-hook 'diary-hook 'appt-make-list)
;; (diary 0)
;; (setq view-diary-entries-initially t)
;; (calendar)
(add-hook 'diary-display-hook 'fancy-diary-display)

(require 'appt)
(defun my/refresh-appt-list ()
;;   "Retain currently set appointments."
  (let ((my/appt-list (copy-sequence appt-time-msg-list)))
    (appt-make-list)
    (setq appt-time-msg-list
          (appt-sort-list
           (nconc appt-time-msg-list my/appt-list)))))
(add-hook 'diary-hook 'my/refresh-appt-list)

(provide 'starter-kit-org)
;; starter-kit-ork.el ends here
