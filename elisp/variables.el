;; variables
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq default-tab-width 2) ; for go. because go uses tabs and go mode doesn't listen to tab width'

(setq helm-candidate-number-limit 25)
(setq helm-split-window-in-side-p t)

(custom-set-variables
 '(helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup --ignore-case")
 '(helm-ag-insert-at-point 'symbol))

(setq ruby-insert-encoding-magic-comment nil)
(setq default-directory "~/")

(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/.saves/")))

(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/.saves/" t)))


(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face empty tabs lines-tail trailing))

(setq visible-bell nil
      ring-bell-function 'flash-bell)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-horizontally)

;; disable pre-input
(setq helm-swoop-pre-input-function
      (lambda () ""))
