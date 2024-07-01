
;; 语言mode
(use-package php-mode
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package kotlin-mode
  :ensure t)
;; 项目管理
(use-package projectile
  :ensure t
  :config
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  (projectile-mode t)
  :bind
  ("C-c C-p" . projectile-command-map))

(use-package helm-projectile
  :ensure t
  :if (functionp 'helm)
  :config
  (helm-projectile-on))

;;git
(use-package magit
  :ensure t)

;; 代码补全
(use-package company
  :ensure t
  :init
  (global-company-mode)
  (company-tng-mode)
  :config
  (setq company-minimum-prefix-length 3) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))


;; lsp配置
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(rust-mode "rust-analyzer"))
  (add-to-list 'eglot-server-programs '((cmake-mode cmake-ts-mode) "cmake-language-server"))
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "clangd"))
  (add-to-list 'eglot-server-programs '(f90-mode . ("fortls" "--lowercase_intrinsics")))
  (add-to-list 'eglot-server-programs '(php-mode . ("phpactor" "language-server" "-vvv")))
  (add-to-list 'eglot-server-programs '(kotlin-mode "kotlin-language-server"))
  :hook
  (rust-mode . eglot-ensure)
  (cmake-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (f90-mode . eglot-ensure)
  (php-mode .eglot-ensure)
  (kotlin-mode . eglot-ensure))
