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
(global-set-key (kbd "C-z") (lambda () (interactive) (god-local-mode-resume)))
(global-set-key (kbd "M-x")                          'undefined)
(global-set-key (kbd "M-x")                          'helm-M-x)
(global-set-key (kbd "C-x r b")                      'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f")                      'helm-find-files)

(provide 'keys)
;;; keys.el ends here
