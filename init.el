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

(setq custom-file "~/.emacs.d/.emacs-cusom.el")
(load custom-file)

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
(load-library "functions")
(load-library "variables")
(load-library "styles")
(load-library "modes")
(load-library "keys")
(load-library "hooks")

(add-to-list 'sml/replacer-regexp-list '("^~/code/" ":C:") t)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init)
;;; init.el ends here
