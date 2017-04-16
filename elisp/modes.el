;;; modes.el --- mode configuration
;;; Commentary:
;; Provides mode configuration

;;; code:
(yas-global-mode)
(counsel-projectile-on)
(projectile-global-mode)
(undo-tree-mode)
(global-anzu-mode)

(flyspell-mode t)
(flyspell-prog-mode)
(global-rbenv-mode t)

(global-auto-revert-mode t)

(show-smartparens-global-mode t)
(smartparens-global-mode t)
(pallet-mode t)

(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))

(add-to-list 'auto-mode-alist
             '("\\.\\(?:tmpl\\|erb\\|mustache\\|djhtml\\)\\'" . web-mode))

(delete-selection-mode 1)
(smart-mode-line-enable)
(god-mode-all)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

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
