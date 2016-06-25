;;; modes.el --- mode configuration
;;; Commentary:
;; Provides mode configuration

;;; code:
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


 (add-to-list 'auto-mode-alist
               '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))

(delete-selection-mode 1)
(smart-mode-line-enable)
(god-mode-all)

(eval-after-load 'eshell
  '(require 'eshell-autojump nil t))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(provide 'modes)
;;; modes.el ends here
