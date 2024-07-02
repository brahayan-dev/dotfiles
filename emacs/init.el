;;; init.el --- The Emacs init file. -*- lexical-binding: t; -*-

;; ------------
;; Disablings
;; ------------
(setq inhibit-startup-message   t
      frame-resize-pixelwise    t
      package-native-compile    t
      initial-scratch-message   nil)

(if (fboundp 'visible-bell) (visible-bell -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))

(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory))))

;; ------------
;; Enablings
;; ------------
(if (fboundp 'set-fringe-mode) (set-fringe-mode 10))
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'global-display-line-numbers-mode) (global-display-line-numbers-mode 1))

(set-face-attribute 'default nil :font "JetBrains Mono-22")
(add-hook 'before-save-hook #'whitespace-cleanup)

(setopt use-short-answers t)
(setq package-enable-at-startup t
      display-line-numbers-type 'relative)

;; Load customization settings first.

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; ------------
;; Packages
;; ------------
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
	("nongnu"       . "https://elpa.nongnu.org/nongnu/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))

(use-package vertico
  :ensure t
  :custom (vertico-cycle t)
  :hook (after-init . vertico-mode))

(use-package projectile
  :ensure t
  :hook ((after-init . projectile-mode))
  :bind (("C-x C-f" . projectile-find-file))
  :custom (projectile-completion-system 'default)
  :bind-keymap (("C-c p" . projectile-command-map)))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode))

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t
	TeX-parse-self t
	font-latex-fontify-script nil
	font-latex-fontify-sectioning 1.0
	font-latex-fontify-sectioning 'color)
  (setq-default TeX-master nil)) ;; Gives support for multifile document structure

(use-package cider
  :ensure t
  :pin melpa-stable)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((clojure-mode . lsp)
	 (clojurescript-mode . lsp)))

(use-package clojure-mode
  :ensure t
  :mode (("\\.edn\\'" . clojure-mode)
	 ("\\.cljx\\'" . clojurex-mode)
	 ("\\.cljc\\'" . clojurec-mode)
	 ("\\.cljs\\'" . clojurescript-mode))
  :config
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode))

(use-package emacs-lisp-mode
  :no-require t
  :mode ("\\.el\\'" "Cask")
  :bind (:map emacs-lisp-mode-map
	      ("C-c C-k" . eval-buffer)
	      ("C-c e c" . cancel-debug-on-entry)
	      ("C-c e d" . debug-on-entry)
	      ("C-c e e" . toggle-debug-on-error)
	      ("C-c e f" . emacs-lisp-byte-compile-and-load)
	      ("C-c e l" . find-library)
	      ("C-c e r" . eval-region)))

(use-package paredit
  :diminish
  :ensure t
  ;; Bind RET to nil, to fix Cider REPL buffer eval issue
  :bind (:map paredit-mode-map ("RET" . nil))
  :hook ((clojure-mode . paredit-mode)
	 (emacs-lisp-mode . paredit-mode)
	 (clojurescript-mode . paredit-mode)))
