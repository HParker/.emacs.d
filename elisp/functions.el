;;; functions.el --- function declarations
;;; Commentary:
;; Provides functions for use later

;;; code:
(require 'crux)

(defun indent-buffer ()
  "Indent whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun god-cursor-on ()
  (setq cursor-type 'box))

(defun god-cursor-off ()
  (setq cursor-type 'hbar))

(defun flash-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

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


(provide 'functions)
;;; functions.el ends here
