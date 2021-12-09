(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)

(straight-use-package 'selectrum)
(straight-use-package 'crux)
(straight-use-package 'doom-themes)
(straight-use-package 'multiple-cursors)
(straight-use-package 'flycheck)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'projectile)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(exec-path-from-shell-initialize)

(add-hook 'after-init-hook #'global-flycheck-mode)

(selectrum-mode +1)

;; Theme
(setq inhibit-startup-message t)
(global-whitespace-mode t)

(blink-cursor-mode 0)
(delete-selection-mode 1)

(toggle-frame-maximized)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (fringe-mode 10)))
(menu-bar-mode -1)

(load-theme 'doom-one t)


;; move autosaves
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/.saves/"))
      auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/.saves/" t)))


(defun flash-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell nil
      ring-bell-function 'flash-bell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-set-key (kbd "M-;")     #'comment-or-uncomment-region)

(global-set-key (kbd "C-k")     #'crux-smart-kill-line)
(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
(global-set-key (kbd "C-o")                    #'crux-smart-open-line)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)


(defun unique-lines-in-region (start end)
    "Find duplicate lines in region START to END keeping first occurrence."
    (interactive "*r")
    (save-excursion
      (let ((end (copy-marker end)))
        (while
            (progn
              (goto-char start)
              (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
          (replace-match "\\1\n\\2")))))

(defun unique-lines-in-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (unique-lines-in-region (point-min) (point-max)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)


