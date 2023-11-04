(require 'package)
(setq package-archives '(("gnu"    . "https://mirror.iscas.ac.cn/elpa/gnu/")
                         ("nongnu" . "https://mirror.iscas.ac.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirror.iscas.ac.cn/elpa/melpa/")))
(global-display-line-numbers-mode)
(package-initialize)
(electric-pair-mode 1)
(set-face-attribute 'default nil :font (font-spec :family "JetBrainsMonoNL NF" :size 18))
(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Source Han Sans SC" :size 18))
;; 安装leaf
(unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))
(leaf leaf-keywords
    :ensure t
    :config (leaf-keywords-init))
;; 安装straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; 安装主题
(leaf atom-one-dark-theme
  :ensure t
  :init
  (load-theme 'atom-one-dark t))
;;终端补全
(leaf vertico
  :ensure t
  :init
  (vertico-mode))
(leaf orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))
(leaf marginalia
  :ensure t
  :init
  (marginalia-mode))
;;更好的搜索
(leaf consult
  :ensure t
  :bind
  ("C-s" . consult-line)
  ("C-r" . consult-grep))
;;文件树
(leaf neotree
  :ensure t
  :bind
  ("<f8>" . neotree-toggle))
;;输入法
(leaf pyim
  :ensure t
  :bind
  ("C-\\" . toggle-input-method))
(leaf pyim-basedict
  :ensure t
  :after(pyim)
  :config
  (pyim-basedict-enable)
  (setq default-input-method "pyim"))
;;补全模板
(leaf yasnippet
  :ensure t
  :config
  (yas-global-mode 1))
(leaf yasnippet-snippets
  :ensure t
  :after (yasnippet))
;;lsp客户端
(leaf lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :bind
  ("C-." . lsp-bridge-find-def)
  ("C-," . lsp-bridge-find-def-return)
  :init
  (global-lsp-bridge-mode)
  :config
  (setq lsp-bridge-c-lsp-server "ccls")
  (setq lsp-bridge-python-lsp-server "jedi"))
;;minibuffer搜索优化
(leaf amx
  :ensure t
  :init(amx-mode))
;;git客户端
(leaf magit
  :ensure t)
;;多窗口切换优化
(leaf ace-window
  :ensure t
  :bind
  ("C-x o" . ace-window))
;;快捷键提示
(leaf which-key
  :ensure t
  :init
  (which-key-mode))
;;C-a优化
(leaf mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))
;;选项卡
(leaf centaur-tabs
  :ensure t
  :demand
  :init
  (centaur-tabs-mode t)
  :config
  (setq centaur-tabs-style "alternate")
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
;;项目管理
(leaf projectile
  :ensure t
  :init(projectile-mode 1)
  :bind
  ("C-c p" . projectile-command-map))
;;dashboard
(leaf dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "原神，启动！") 
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-startup-banner 'official)
  (setq dashboard-items '((recents  . 5)   
			  (bookmarks . 5)  
			  (projects . 10)))
  (dashboard-setup-startup-hook))
;;彩虹括号
(leaf rainbow-delimiters
  :ensure t
  :hook
  (prog-mode-hook . rainbow-delimiters-mode))
;;语言相关
(leaf markdown-mode
  :ensure t)
(leaf rust-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0c860c4fe9df8cff6484c54d2ae263f19d935e4ff57019999edbda9c7eda50b8" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages '(leaf)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
