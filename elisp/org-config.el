;;; modes.el --- mode configuration
;;; Commentary:
;; Provides mode configuration

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (sh . t)
         (calc . t)
         (ruby . t)
         (python . t))))

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-c l" 'org-store-link)
(global-set-key "\C-c a" 'org-agenda)
(global-set-key "\C-c c" 'org-capture)

(setq org-default-notes-file (concat org-directory "/notes.org"))

;; stop emacs asking for confirmation
(setq org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t)
(setq org-log-done 'time)
(provide 'org-config)
