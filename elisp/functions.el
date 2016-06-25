;;; functions.el --- function declarations
;;; Commentary:
;; Provides functions for use later

;;; code:
(require 'crux)
(defun god-cursor-update ()
  "Change the cursor to box when god-mode is enabled and to bar when inserting."
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))
(defun flash-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(defun smart-kill-line ()
  "Kill to the end of the line and kill whole line on the next keypress"
  (interactive)
  (let ((orig-point (point)))
    (move-end-of-line 1)
    (if (= orig-point (point))
        (crux-kill-whole-line)
      (progn
        (goto-char orig-point)
        (kill-line))
      )))


(provide 'functions)
;;; functions.el ends here
