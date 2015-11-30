;;; modes.el --- mode configuration
;;; Commentary:
;; Provides mode configuration

;;; code:
(set-face-attribute 'default nil :height 122)
(yas-global-mode)
(helm-projectile-on)
(helm-mode 1)
(projectile-global-mode)
(undo-tree-mode)

(flyspell-mode t)
(flyspell-prog-mode)
(global-rbenv-mode t)

(global-auto-revert-mode t)


(show-paren-mode t)
(smartparens-global-mode)
(pallet-mode t)


(delete-selection-mode 1)
(smart-mode-line-enable)
(god-mode-all)

(provide 'modes)
;;; modes.el ends here
