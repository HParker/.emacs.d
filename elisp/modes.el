;;; modes.el --- mode configuration
;;; Commentary:
;; Provides mode configuration

;;; code:
(yas-global-mode)
(counsel-projectile-mode)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
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
             '("Dangerfile" . ruby-mode))

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


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(provide 'modes)
;;; modes.el ends here
