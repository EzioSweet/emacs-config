(require 'package)
(setq package-archives '(("gnu"    . "https://mirror.iscas.ac.cn/elpa/gnu/")
                         ("nongnu" . "https://mirror.iscas.ac.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirror.iscas.ac.cn/elpa/melpa/")))
(global-display-line-numbers-mode)
(package-initialize)
(electric-pair-mode 1)
(load-theme 'atom-one-dark t)
(use-package helm
  :ensure t
  :init (helm-mode))
(use-package amx
  :ensure t
  :init (amx-mode))
(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))
(use-package neotree
    :ensure t
    :bind
    ("<f8>" . neotree-toggle))
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))
(use-package which-key
  :ensure t
  :init (which-key-mode))
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))
 (use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "向着星辰与深渊") ;; 个性签名，随读者喜好设置
  ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  (dashboard-setup-startup-hook))
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package company
  :ensure t
  :init (global-company-mode)
  :hook
  (after-init . company-tng-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '((cmake-mode cmake-ts-mode) "cmake-language-server"))
  (add-to-list 'eglot-server-programs '((python-mode python-ts-mode) "jedi-language-server"))
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "ccls"))
  (add-to-list 'eglot-server-programs '(f90-mode . ("fortls" "--lowercase_intrinsics")))
  :hook
  (cmake-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (f90-mode . eglot-ensure))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit atom-one-dark-theme use-package ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
