(setq inhibit-startup-message t)
(set-face-attribute 'default nil :height 160)

(load-theme 'monokai t)
(global-hl-line-mode)

;; white space
(global-whitespace-mode t)

(blink-cursor-mode 0)

(set-face-attribute 'default nil :height 140)

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (fringe-mode 10)))
(menu-bar-mode -1)

(setq projectile-mode-line '(:eval (format " P[%s]" (projectile-project-name))))
(setq wilt-mode-line-template " W=%.2f")
(setq rm-blacklist
      (quote (" WS" " SP" " Helm" " Fly" " company" " RuboCop" " ," " robe" " yas")))
