;;; init.el --- Adam's top level config
;;
;; Author: Adam Hess <adamhess1991@gmail.com>
;; Have fun.
;;
;;; Commentary:
;; Trying to make the most helpful emacs I can.
;;
;;; License:
;; MIT
;;; code:

(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load custom-file 'noerror)

(setq user-full-name "Adam Hess"
      user-mail-address "adamhess1991@gmail.com")

;; Always load newest byte code
;; (setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)


(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(if (eq system-type 'darwin)
    (progn
      (setq ispell-program-name "/usr/local/bin/ispell")
      (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el"))
  (progn
    (setq-default ispell-program-name "/usr/bin/aspell")
    (require 'cask "~/.cask/cask.el")))


(cask-initialize)

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'load-path "~/.emacs.d/elisp/")
(require 'functions)
(require 'variables)
(require 'styles)
(require 'modes)
(require 'keys)
(require 'hooks)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init)
;;; init.el ends here
