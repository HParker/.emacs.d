(setq inhibit-startup-message t)
(set-face-attribute 'default nil :height 140)

(load-theme 'doom-one t)

(global-hl-line-mode)

;; white space
(global-whitespace-mode t)

(blink-cursor-mode 0)
(toggle-frame-maximized)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (fringe-mode 10)))
(menu-bar-mode -1)

(setq projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))
(setq rm-blacklist
      (quote (" WS" " SP" " Fly" " company" " RuboCop" " ," " robe" " yas" " Anzu" " God")))

(provide 'styles)
;; styles.el ends here
