;;; keys.el --- custom key mapping
;;; Commentary:
;; declare some custom keys

;;; code:
;; god keys
(global-set-key (kbd "<escape>") (lambda () (interactive) (god-local-mode-resume)))
(define-key god-local-mode-map (kbd "i") (lambda () (interactive) (god-local-mode-pause)))
(define-key god-local-mode-map (kbd ".") 'repeat)

;; Window move
(define-key god-local-mode-map (kbd "B") 'windmove-left)
(define-key god-local-mode-map (kbd "F") 'windmove-right)
(define-key god-local-mode-map (kbd "P") 'windmove-up)
(define-key god-local-mode-map (kbd "N") 'windmove-down)

;; regular key bindings
(global-set-key (kbd "C-z")     (lambda () (interactive) (god-local-mode-resume)))
(global-set-key (kbd "C-Z")     (lambda () (interactive) (god-local-mode-resume)))
(global-set-key (kbd "M-;")     #'comment-or-uncomment-region)
(global-set-key (kbd "C-u")     #'counsel-yank-pop)
(global-set-key (kbd "M-u")     #'undo-tree-visualize)
(global-set-key (kbd "M-s")     #'counsel-projectile-ag)
(global-set-key (kbd "C-s")     #'swiper)
(global-set-key (kbd "C-=")     #'er/expand-region)
(global-set-key (kbd "C-c b")   #'magit-blame)
(global-set-key (kbd "C-c g")   #'magit-status)
(global-set-key (kbd "C-c r")   #'github-browse-file)
(global-set-key (kbd "C->")     #'mc/mark-next-like-this)
(global-set-key (kbd "C-<")     #'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") #'mc/mark-all-like-this)
(global-set-key (kbd "M-x")     #'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-j")     #'avy-goto-word-1)
(global-set-key (kbd "S-r")     #'recompile)
(global-set-key (kbd "C-k")     #'smart-kill-line)
(global-set-key (kbd "M-%")     #'anzu-query-replace)


;; CRUX bindings
(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
(global-set-key (kbd "C-o")                    #'crux-smart-open-line)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)


(provide 'keys)
;;; keys.el ends here
