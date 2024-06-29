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
