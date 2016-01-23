;;; keys.el --- custom key mapping
;;; Commentary:
;; declare some custom keys

;;; code:
;; god keys
(global-set-key (kbd "<escape>") (lambda () (interactive) (god-local-mode-resume)))
(define-key god-local-mode-map (kbd "i") (lambda () (interactive) (god-local-mode-pause)))
(define-key god-local-mode-map (kbd "j") 'ace-jump-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key god-local-mode-map (kbd "J") 'robe-jump)
(define-key god-local-mode-map (kbd "U") 'undo-tree-visualize)
;; regular key bindings
(global-set-key (kbd "C-z") (lambda () (interactive) (god-local-mode-resume)))
(global-set-key (kbd "C-Z") (lambda () (interactive) (god-local-mode-resume)))
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-s") 'helm-do-ag-project-root)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-r") 'helm-swoop)
(global-set-key (kbd "C-:") 'execute-extended-command)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-/") 'hippie-expand)
(global-set-key (kbd "C-c b") 'magit-blame)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; not all of these are working. I need to revisit the blog post about it
(bind-keys
 :map smartparens-mode-map
 ("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)

 ("C-<down>" . sp-down-sexp)
 ("C-<up>"   . sp-up-sexp)
 ("M-<down>" . sp-backward-down-sexp)
 ("M-<up>"   . sp-backward-up-sexp)

 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)

 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)

 ("C-S-f" . sp-forward-symbol)
 ("C-S-b" . sp-backward-symbol)

 ("C-<right>" . sp-forward-slurp-sexp)
 ("M-<right>" . sp-forward-barf-sexp)
 ("C-<left>"  . sp-backward-slurp-sexp)
 ("M-<left>"  . sp-backward-barf-sexp)

 ("C-M-t" . sp-transpose-sexp)
 ("C-M-k" . sp-kill-sexp)
 ("C-k"   . sp-kill-hybrid-sexp)
 ("M-k"   . sp-backward-kill-sexp)
 ("C-M-w" . sp-copy-sexp)

 ("C-M-d" . delete-sexp)

 ("M-<backspace>" . backward-kill-word)
 ("C-<backspace>" . sp-backward-kill-word)
 ([remap sp-backward-kill-word] . backward-kill-word)

 ("M-[" . sp-backward-unwrap-sexp)
 ("M-]" . sp-unwrap-sexp)

 ("C-x C-t" . sp-transpose-hybrid-sexp)

 ("C-c ("  . wrap-with-parens)
 ("C-c ["  . wrap-with-brackets)
 ("C-c {"  . wrap-with-braces)
 ("C-c '"  . wrap-with-single-quotes)
 ("C-c \"" . wrap-with-double-quotes)
 ("C-c _"  . wrap-with-underscores)
 ("C-c `"  . wrap-with-back-quotes))

(provide 'keys)
;;; keys.el ends here
