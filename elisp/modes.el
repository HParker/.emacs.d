;;; modes.el --- mode configuration
;;; Commentary:
;; Provides mode configuration

;;; code:
;; (set-face-attribute 'default nil :height 130)
(yas-global-mode)
(helm-projectile-on)
(helm-mode 1)
(projectile-global-mode)
(undo-tree-mode)

(flyspell-mode t)
(flyspell-prog-mode)
(global-rbenv-mode t)

(global-auto-revert-mode t)

(show-smartparens-global-mode t)
(smartparens-global-mode t)
(pallet-mode t)


(delete-selection-mode 1)
(smart-mode-line-enable)
(god-mode-all)

(eval-after-load 'eshell
  '(require 'eshell-autojump nil t))

(eval-after-load 'company
  '(push 'company-robe company-backends))
(eshell-did-you-mean-setup)

(provide 'modes)
;;; modes.el ends here
