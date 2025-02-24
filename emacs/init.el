(setq inhibit-startup-message t
      visible-bell t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)
(global-display-line-numbers-mode 1)

(load-theme 'modus-vivendi t)


;; Enable package management
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable `use-package`
(eval-when-compile
  (require 'use-package))

(use-package zig-mode
  :ensure t
  :mode "\\.zig\\'"
  :config
  (setq zig-format-on-save t))

(use-package lsp-mode
  :ensure t
  :hook (zig-mode . lsp)
  :commands lsp)

(use-package company
  :ensure t
  :config
  (global-company-mode t))

