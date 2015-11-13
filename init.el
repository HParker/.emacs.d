;;; init.el --- Adam's config-changed-event
;;
;; Author: Adam Hess <adamhess1991@gmail.com>
;; Have fun.
;;
;;; Commentary:
;; Trying to make the most helpful emacs I can.
;;
;;; License:
;; MIT

(add-to-list 'exec-path "/usr/local/bin")
(setq-default ispell-program-name "/usr/bin/aspell")
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/.saves/")))

(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/.saves/" t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 122)
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(if (eq system-type 'darwin)
    (progn
      (setq ispell-program-name "/usr/local/bin/ispell")
      (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el"))
  (require 'cask "/home/hparker/.cask/cask.el")
)

(cask-initialize)

(setq inhibit-startup-message t)
(delete-selection-mode 1)
(add-to-list 'load-path "~/.emacs.d/elisp/")
;; (load-library "style")
;; (load-library "keys")
;; (load-library "modes")

(load-theme 'monokai t)

(global-hl-line-mode)

(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)


(setq default-directory "~/")
(smart-mode-line-enable)

(god-mode-all)

(global-set-key (kbd "<escape>") (lambda () (interactive) (god-local-mode-resume)))
(define-key god-local-mode-map (kbd "i") (lambda () (interactive) (god-local-mode-pause)))
(define-key god-local-mode-map (kbd "j") 'ace-jump-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)

(global-set-key (kbd "C-;") 'undo-tree-visualize)
(global-set-key (kbd "M-s") 'helm-do-ag-project-root)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-:") 'execute-extended-command)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-c b") 'magit-blame)
(global-set-key (kbd "C-x g") 'magit-status)

(custom-set-variables
 '(helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup --ignore-case")
 '(helm-ag-insert-at-point 'symbol))

(defun god-cursor-update ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'god-cursor-update)
(add-hook 'god-mode-disabled-hook 'god-cursor-update)
;; (add-hook 'buffer-list-update-hook 'god-cursor-update)

(show-paren-mode t)
(smartparens-global-mode)
(pallet-mode t)


(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(helm-mode 1)

(undo-tree-mode)

(flyspell-mode t)
(flyspell-prog-mode)

(global-auto-revert-mode t)

(projectile-global-mode)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-rbenv-mode t)

(add-hook 'ruby-mode-hook 'rubocop-mode)

(require 'helm-projectile)
(helm-projectile-on)

(setq helm-candidate-number-limit 25)
(setq helm-split-window-in-side-p t)

(blink-cursor-mode 0)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(defun flash-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell nil
      ring-bell-function 'flash-bell)

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (fringe-mode 10)))
(menu-bar-mode -1)

;; Thank the emacs gods, the tabs are gone.
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(put 'upcase-region 'disabled nil)
