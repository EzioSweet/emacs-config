(require 'package)
(setq package-archives '(("gnu"    . "https://mirror.iscas.ac.cn/elpa/gnu/")
                         ("nongnu" . "https://mirror.iscas.ac.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirror.iscas.ac.cn/elpa/melpa/")))



(load "~/.emacs.d/common.el")

(load "~/.emacs.d/program.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(package-selected-packages
   '(smart-mode-line-atom-one-dark-theme magit atom-one-dark-theme use-package ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
