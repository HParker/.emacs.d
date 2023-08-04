(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package crux
  :bind (
         ("C-o" . crux-smart-open-line)
         ("C-k" . crux-smart-kill-line)
	 ([remap move-beginning-of-line] . crux-move-beginning-of-line)
	 )
  )


(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package multiple-cursors
  :bind (
	 ("C->" . mc/mark-next-like-this)
	 ("C->" . mc/mark-previous-like-this)
	 )
  )

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(ruby-mode "ruby-lsp")
	       )
  )

;; TODO: hack to change the eglot server program for ruby
(defvar eglot-server-programs `(((rust-ts-mode rust-mode) . ("rust-analyzer"))
                                ((cmake-mode cmake-ts-mode) . ("cmake-language-server"))
                                (vimrc-mode . ("vim-language-server" "--stdio"))
                                ((python-mode python-ts-mode)
                                 . ,(eglot-alternatives
                                     '("pylsp" "pyls" ("pyright-langserver" "--stdio") "jedi-language-server")))
                                ((js-json-mode json-mode json-ts-mode)
                                 . ,(eglot-alternatives '(("vscode-json-language-server" "--stdio")
                                                          ("vscode-json-languageserver" "--stdio")
                                                          ("json-languageserver" "--stdio"))))
                                ((js-mode js-ts-mode tsx-ts-mode typescript-ts-mode typescript-mode)
                                 . ("typescript-language-server" "--stdio"))
                                ((bash-ts-mode sh-mode) . ("bash-language-server" "start"))
                                ((php-mode phps-mode)
                                 . ,(eglot-alternatives
                                     '(("phpactor" "language-server")
                                       ("php" "vendor/felixfbecker/language-server/bin/php-language-server.php"))))
                                ((c-mode c-ts-mode c++-mode c++-ts-mode)
                                 . ,(eglot-alternatives
                                     '("clangd" "ccls")))
                                (((caml-mode :language-id "ocaml")
                                  (tuareg-mode :language-id "ocaml") reason-mode)
                                 . ("ocamllsp"))
                                ((ruby-mode ruby-ts-mode)
                                 . ("ruby-lsp"))
                                (haskell-mode
                                 . ("haskell-language-server-wrapper" "--lsp"))
                                (elm-mode . ("elm-language-server"))
                                (mint-mode . ("mint" "ls"))
                                (kotlin-mode . ("kotlin-language-server"))
                                ((go-mode go-dot-mod-mode go-dot-work-mode go-ts-mode go-mod-ts-mode)
                                 . ("gopls"))
                                ((R-mode ess-r-mode) . ("R" "--slave" "-e"
                                                        "languageserver::run()"))
                                ((java-mode java-ts-mode) . ("jdtls"))
                                ((dart-mode dart-ts-mode)
                                 . ("dart" "language-server"
                                    "--client-id" "emacs.eglot-dart"))
                                ((elixir-mode elixir-ts-mode heex-ts-mode)
                                 . ,(if (and (fboundp 'w32-shell-dos-semantics)                                             (w32-shell-dos-semantics))
                                        '("language_server.bat")
                                      '("language_server.sh")))
                                (ada-mode . ("ada_language_server"))
                                (scala-mode . ,(eglot-alternatives
                                                '("metals" "metals-emacs")))
                                (racket-mode . ("racket" "-l" "racket-langserver"))
                                ((tex-mode context-mode texinfo-mode bibtex-mode)
                                 . ,(eglot-alternatives '("digestif" "texlab")))
                                (erlang-mode . ("erlang_ls" "--transport" "stdio"))
                                ((yaml-ts-mode yaml-mode) . ("yaml-language-server" "--stdio"))
                                (nix-mode . ,(eglot-alternatives '("nil" "rnix-lsp")))
                                (gdscript-mode . ("localhost" 6008))
                                ((fortran-mode f90-mode) . ("fortls"))
                                (futhark-mode . ("futhark" "lsp"))
                                (lua-mode . ,(eglot-alternatives
                                              '("lua-language-server" "lua-lsp")))
                                (zig-mode . ("zls"))
                                ((css-mode css-ts-mode)
                                 . ,(eglot-alternatives '(("vscode-css-language-server" "--stdio")
                                                          ("css-languageserver" "--stdio"))))
                                (html-mode . ,(eglot-alternatives '(("vscode-html-language-server" "--stdio") ("html-languageserver" "--stdio"))))
                                ((dockerfile-mode dockerfile-ts-mode) . ("docker-langserver" "--stdio"))
                                ((clojure-mode clojurescript-mode clojurec-mode clojure-ts-mode)
                                 . ("clojure-lsp"))
                                ((csharp-mode csharp-ts-mode)
                                 . ,(eglot-alternatives
                                     '(("omnisharp" "-lsp")
                                       ("csharp-ls"))))
                                (purescript-mode . ("purescript-language-server" "--stdio"))
                                ((perl-mode cperl-mode) . ("perl" "-MPerl::LanguageServer" "-e" "Perl::LanguageServer::run"))
                                (markdown-mode
                                 . ,(eglot-alternatives
                                     '(("marksman" "server")
                                       ("vscode-markdown-language-server" "--stdio"))))
                                (graphviz-dot-mode . ("dot-language-server" "--stdio")))
  "How the command `eglot' guesses the server to start.
An association list of (MAJOR-MODE . CONTACT) pairs.  MAJOR-MODE
identifies the buffers that are to be managed by a specific
language server.  The associated CONTACT specifies how to connect
to a server for those buffers.

MAJOR-MODE can be:

* In the most common case, a symbol such as `c-mode';

* A list (MAJOR-MODE-SYMBOL :LANGUAGE-ID ID) where
  MAJOR-MODE-SYMBOL is the aforementioned symbol and ID is a
  string identifying the language to the server;

* A list combining the previous two alternatives, meaning
  multiple major modes will be associated with a single server
  program.  This association is such that the same resulting
  server process will manage buffers of different major modes.

CONTACT can be:

* In the most common case, a list of strings (PROGRAM [ARGS...]).
  PROGRAM is called with ARGS and is expected to serve LSP requests
  over the standard input/output channels.

* A list (PROGRAM [ARGS...] :initializationOptions OPTIONS),
  whereupon PROGRAM is called with ARGS as in the first option,
  and the LSP \"initializationOptions\" JSON object is
  constructed from OPTIONS.  If OPTIONS is a unary function, it
  is called with the server instance and should return a JSON
  object.

* A list (HOST PORT [TCP-ARGS...]) where HOST is a string and
  PORT is a positive integer for connecting to a server via TCP.
  Remaining ARGS are passed to `open-network-stream' for
  upgrading the connection with encryption or other capabilities.

* A list (PROGRAM [ARGS...] :autoport [MOREARGS...]), whereupon a
  combination of previous options is used.  First, an attempt is
  made to find an available server port, then PROGRAM is launched
  with ARGS; the `:autoport' keyword substituted for that number;
  and MOREARGS.  Eglot then attempts to establish a TCP
  connection to that port number on the localhost.

* A cons (CLASS-NAME . INITARGS) where CLASS-NAME is a symbol
  designating a subclass of `eglot-lsp-server', for representing
  experimental LSP servers.  INITARGS is a keyword-value plist
  used to initialize the object of CLASS-NAME, or a plain list
  interpreted as the previous descriptions of CONTACT.  In the
  latter case that plain list is used to produce a plist with a
  suitable :PROCESS initarg to CLASS-NAME.  The class
  `eglot-lsp-server' descends from `jsonrpc-process-connection',
  which you should see for the semantics of the mandatory
  :PROCESS argument.

* A function of a single argument producing any of the above
  values for CONTACT.  The argument's value is non-nil if the
  connection was requested interactively (e.g. from the `eglot'
  command), and nil if it wasn't (e.g. from `eglot-ensure').  If
  the call is interactive, the function can ask the user for
  hints on finding the required programs, etc.  Otherwise, it
  should not ask the user for any input, and return nil or signal
  an error if it can't produce a valid CONTACT.  The helper
  function `eglot-alternatives' (which see) can be used to
  produce a function that offers more than one server for a given
  MAJOR-MODE.")



(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package anzu
  :bind (
	 ([remap query-replace] . anzu-query-replace)
	 ([remap query-replace-regexp] . anzu-query-replace-regexp)
	 )
  :init
  (global-anzu-mode +1)

  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)

  (custom-set-variables
   '(anzu-mode-lighter "")
   '(anzu-deactivate-region t)
   '(anzu-search-threshold 1000)
   '(anzu-replace-threshold 50)
   '(anzu-replace-to-string-separator " => ")))

;; (use-package consult)
;; (use-package marginalia)



(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))


;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))


;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))


(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc.  You may adjust the Eldoc
  ;; strategy, if you want to see the documentation from multiple providers.
  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("C-s" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  ;;;; 4. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 5. No project support
  ;; (setq consult-project-function nil)
)


(setq inhibit-startup-message t)
;; (global-whitespace-mode t)

(blink-cursor-mode 0)
(delete-selection-mode 1)

(toggle-frame-maximized)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (fringe-mode 10)))
(menu-bar-mode -1)

(global-set-key (kbd "M-;")     #'comment-or-uncomment-region)

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


(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-exclude-modes'.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-threshold 50)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(package-selected-packages
   '(eglot flycheck corfu yaml-mode vertico use-package rust-mode orderless multiple-cursors marginalia embark-consult editorconfig doom-themes crux call-graph)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(add-to-list 'major-mode-remap-alist '(ruby-mode . ruby-ts-mode))
