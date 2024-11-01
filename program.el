(use-package treesit
  :config
  (setq treesit-font-lock-level 4)
  (setq major-mode-remap-alist
	'((yaml-mode . yaml-ts-mode)
	  (bash-mode . bash-ts-mode)
	  (js2-mode . js-ts-mode)
	  (typescript-mode . typescript-ts-mode)
	  (json-mode . json-ts-mode)
	  (css-mode . css-ts-mode)
	  (python-mode . python-ts-mode)
	  (c-mode . c-ts-mode)
	  (c++-mode . c++-ts-mode)))
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
  (add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-ts-mode)))
(use-package markdown-mode
  :ensure t)
(use-package meson-mode
  :ensure t)
;; 项目管理
(use-package projectile
  :ensure t
  :config
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  (projectile-mode t)
  :bind
  ("C-c C-p" . projectile-command-map))

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
  (setq company-minimum-prefix-length 2) ; 敲 2 个字母开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))


;; lsp配置
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(rust-ts-mode "rust-analyzer"))
  (add-to-list 'eglot-server-programs '(cmake-ts-mode . ("neocmakelsp" "stdio")))
  (add-to-list 'eglot-server-programs '(meson-mode . ("mesonlsp" "--lsp")))
  (add-to-list 'eglot-server-programs '((c-ts-mode c++-ts-mode) . ("clangd" "--compile-commands-dir=build")))
  (add-to-list 'eglot-server-programs '(python-ts-mode "jedi-language-server" ))
  (add-to-list 'eglot-server-programs '(f90-mode . ("fortls" "--lowercase_intrinsics")))
  (add-to-list 'eglot-server-programs '(php-ts-mode . ("phpactor" "language-server" "-vvv")))
  (add-to-list 'eglot-server-programs '(java-ts-mode "jdtls"))
  :hook
  (rust-ts-mode . eglot-ensure)
  (cmake-ts-mode . eglot-ensure)
  (c-ts-mode . eglot-ensure)
  (c++-ts-mode . eglot-ensure)
  (python-ts-mode . eglot-ensure)
  (f90-mode . eglot-ensure)
  (php-ts-mode . eglot-ensure)
  (java-ts-mode . eglot-ensure)
  (kotlin-mode . eglot-ensure)
  (meson-mode . eglot-ensure))
