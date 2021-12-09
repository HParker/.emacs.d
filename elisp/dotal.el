 ;;; dotal.el --- Dotal major mode

;; Copyright (C) 2001  Free Software Foundation, Inc.

;; Author: StefanMonnier
;; Keywords: extensions

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

 ;;; Commentary:

 ;;; Code:

(defvar dotal-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [foo] 'dotal-do-foo)
    map)
  "Keymap for `dotal-mode'.")

(defvar dotal-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; (modify-syntax-entry ?# "<" st)
    ;; (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for `dotal-mode'.")

(defvar dotal-font-lock-keywords
  '("\\<fn\\|\\(&&\\|break\\|do\\|e\\(?:lse\\(?:if\\)?\\|nd\\)\\|get\\|i\\(?:16s?\\|8s\\|[8f]\\)\\|p\\(?:ad\\|\\(?:rin\\|u\\)t\\)\\|return\\|s\\(?:end\\|prite:\\)\\|theme\\|while\\|||\\)\\>" (1 font-lock-function-name-face)))

;; (defvar dotal-imenu-generic-expression
;;   ...)

;; (defvar dotal-outline-regexp
;;   ...)

;;;###autoload
(define-derived-mode dotal-mode fundamental-mode "Dotal"
  "A major mode for editing Dotal files."
  :syntax-table dotal-mode-syntax-table
  (setq-local comment-start "-- ")
  (setq-local comment-start-skip "-- +\\s-*")
  (setq-local font-lock-defaults
	      '(dotal-font-lock-keywords))
  (setq-local indent-line-function 'dotal-indent-line)
  ;; (setq-local imenu-generic-expression
  ;;             dotal-imenu-generic-expression)
  ;; (setq-local outline-regexp dotal-outline-regexp)
  )

;;  ;;; Indentation

;; (defun dotal-indent-line ()
;;   "Indent current line of Dotal code."
;;   (interactive)
;;   (let ((savep (> (current-column) (current-indentation)))
;; 	(indent (condition-case nil (max (dotal-calculate-indentation) 0)
;; 		  (error 0))))
;;     (if savep
;; 	(save-excursion (indent-line-to indent))
;;       (indent-line-to indent))))

;; (defun dotal-calculate-indentation ()
;;   "Return the column to which the current line should be indented."
;;   ...)


(provide 'dotal)
 ;;; dotal.el ends here
