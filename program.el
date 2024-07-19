;; 语言mode
(use-package php-mode
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package kotlin-mode
  :ensure t)
(use-package meson-mode
  :ensure t)
(use-package js2-mode
  :ensure t
  :hook (find-file . (lambda ()
                        (when (and (buffer-file-name)
                                   (string-equal (file-name-extension buffer-file-name) "jsx"))
                          (js2-minor-mode t)))))
(use-package typescript-mode
  :ensure t)
(use-package vue-mode
  :ensure t)
(use-package emmet-mode
  :ensure t
  :hook
  (css-mode . emmet-mode)
  (js2-mode . emmet-mode)
  (js2-minor-mode . emmet-mode)
  (typescript-mode . emmet-mode)
  :config
  (define-key emmet-mode-keymap (kbd "M-q") 'emmet-expand-line))
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
  (add-to-list 'eglot-server-programs '(rust-mode "rust-analyzer"))
  (add-to-list 'eglot-server-programs '(cmake-mode . ("neocmakelsp" "stdio")))
  (add-to-list 'eglot-server-programs '(meson-mode . ("mesonlsp" "--lsp")))
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd" "--compile-commands-dir=build")))
  (add-to-list 'eglot-server-programs '(python-mode "jedi-language-server" ))
  (add-to-list 'eglot-server-programs '(f90-mode . ("fortls" "--lowercase_intrinsics")))
  (add-to-list 'eglot-server-programs '(php-mode . ("phpactor" "language-server" "-vvv")))
  (add-to-list 'eglot-server-programs '(kotlin-mode "kotlin-language-server"))
  (add-to-list 'eglot-server-programs '(java-mode "jdtls"))
  (add-to-list 'eglot-server-programs '((js2-mode typescript-mode js2-minor-mode) . ("typescript-language-server" "--stdio")))
  :hook
  (rust-mode . eglot-ensure)
  (cmake-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (f90-mode . eglot-ensure)
  (php-mode . eglot-ensure)
  (java-mode . eglot-ensure)
  (kotlin-mode . eglot-ensure)
  (js2-mode . eglot-ensure)
  (js2-minor-mode . eglot-ensure)
  (typescript-mode . eglot-ensure)
  (meson-mode . eglot-ensure))
