;; Basic UI settings
(setq inhibit-startup-message t
      visible-bell t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)
(global-display-line-numbers-mode 1)

(load-theme 'modus-vivendi t)

;; Silence compiler warnings
(setq byte-compile-warnings '(not unused-value))

;; Package management
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Zig configuration
(use-package zig-mode
  :ensure t
  :mode "\\.zig\\'"
  :config
  (setq zig-format-on-save t))

;; LSP configuration
(use-package lsp-mode
  :ensure t
  :hook
  ((zig-mode . lsp)
   (nix-mode . lsp))
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("nil"))
    :activation-fn (lsp-activate-on "nix")
    :server-id 'nil
    :priority 1
    :download-server-fn
    (lambda (_client callback error-callback _update?)
      (if-let ((nil-path (executable-find "nil")))
          (funcall callback)
        (funcall error-callback "Could not find 'nil' in PATH"))))))

;; Company mode
(use-package company
  :ensure t
  :config
  (global-company-mode t))

;; Nix mode
(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

;; Formatting
(use-package format-all
  :ensure t
  :hook (nix-mode . format-all-mode)
  :config
  (add-to-list 'format-all-formatters '("Nix" nixpkgs-fmt))
  (setq byte-compile-warnings '(not docstrings)))
