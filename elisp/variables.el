;; variables

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq-default indent-tabs-mode nil)
 ; for go. because go uses tabs and go mode doesn't listen to tab width'
(setq tab-width 2)

(setq flycheck-status-emoji-mode 1)

(setq ruby-insert-encoding-magic-comment nil)
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq default-directory "~/")

;; move autosaves
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/.saves/"))
      auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/.saves/" t)))

(setq whitespace-line-column 80 ;; limit line length
      whitespace-style '(face tempty abs lines-tail trailing))

(setq visible-bell nil
      ring-bell-function 'flash-bell)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(setq tramp-default-method "ssh")

(setq elm-format-on-save t)

(provide 'variables)
;; variables.el ends here
