;;; hooks.el --- mode configuration
;;; Commentary:
;; Provides hook configuration

;;; code:
(add-hook 'god-mode-enabled-hook 'god-cursor-update)
(add-hook 'god-mode-disabled-hook 'god-cursor-update)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'after-init-hook 'global-emojify-mode)
;; (add-hook 'after-init-hook #'nyan-mode) ; seems to be moving things off the edge

(add-hook 'text-mode-hook 'flyspell-mode)

(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'wilt-mode)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode) ; I still cannot use strict mode

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'rbenv-use-corresponding)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-yaruby-mode-hook 'rbenv-use-corresponding)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)


(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

(provide 'hooks)
;;; hooks.el ends here
