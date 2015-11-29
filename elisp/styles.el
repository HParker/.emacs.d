(setq inhibit-startup-message t)

(load-theme 'monokai t)
(global-hl-line-mode)

;; white space
(global-whitespace-mode t)

(blink-cursor-mode 0)

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (fringe-mode 10)))
(menu-bar-mode -1)
