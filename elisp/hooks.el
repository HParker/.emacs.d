;;; hooks.el --- mode configuration
;;; Commentary:
;; Provides hook configuration

;;; code:
(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode 1)
            (setq tab-width 2)))

(add-hook 'god-mode-enabled-hook 'god-cursor-on)
(add-hook 'god-mode-disabled-hook 'god-cursor-off)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)

(add-hook 'text-mode-hook 'flyspell-mode)

(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'rbenv-use-corresponding)

(add-hook 'enh-yaruby-mode-hook 'rbenv-use-corresponding)

(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'racer-mode-hook 'eldoc-mode)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;; Fix junk characters in shell-mode
(require 'ansi-color)
(defun my/ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'my/ansi-colorize-buffer)


;; (eval-after-load "flycheck"
;;   '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

(provide 'hooks)
;;; hooks.el ends here
