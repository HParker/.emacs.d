;;; hooks.el --- mode configuration
;;; Commentary:
;; Provides hook configuration

;;; code:
(add-hook 'god-mode-enabled-hook 'god-cursor-update)
(add-hook 'god-mode-disabled-hook 'god-cursor-update)
(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'after-init-hook #'nyan-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'wilt-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(provide 'hooks)
;;; hooks.el ends here
