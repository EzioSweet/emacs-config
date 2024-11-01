;; 设置主题以及一些基本的设置
(use-package monokai-theme
  :ensure t
  :init
  (load-theme 'monokai t)
  (package-initialize t)
  (electric-pair-mode t)
  (fido-vertical-mode t)
  (setq indent-tabs-mode nil)
  (pixel-scroll-precision-mode t)
  :hook
  (prog-mode . display-line-numbers-mode))
;; 设置modeline
(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode t))

;; minibuffer 排序以及历史记录、键位提醒
(use-package amx
  :ensure t
  :init (amx-mode))

;; 撤销树
(use-package vundo
  :ensure t
  :bind
  ("C-w" . vundo))

;; 选项卡
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "alternate")
  :bind
  ("C-<f12>" . centaur-tabs-backward)
  ("<f12>" . centaur-tabs-forward))

;; 更好的buffer间跳转
(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

;; 文件树
(use-package neotree
    :ensure t
    :bind
    ("<f8>" . neotree-toggle))
;; 更好的搜索
(use-package ctrlf
  :ensure t
  :init
  (ctrlf-mode t))
;; 更好的到达行首和行尾
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

;; 快捷键提示
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; fuzzy searching
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle)))
;; 开始面板
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "一场闹剧，诸般烦恼，终究不过，庸人自扰。") ;; 个性签名，随读者喜好设置
  (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
                          (bookmarks . 5)  ;; 显示多少个最近书签
                          (projects . 10))))
;; 高亮符号
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol))

;; 彩虹括号
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

