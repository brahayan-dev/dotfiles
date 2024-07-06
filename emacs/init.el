;;; init.el --- The Emacs init file. -*- lexical-binding: t; -*-

;; ------------
;; Disablings
;; ------------
(setq backup-by-copying         t
      frame-resize-pixelwise    t
      inhibit-startup-message   t
      initial-scratch-message   nil
      package-enable-at-startup nil)

(if (fboundp 'visible-bell) (visible-bell -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))

;; ------------
;; Enablings
;; ------------
(set-face-attribute 'default nil :font "JetBrains Mono-22")
(add-hook 'before-save-hook #'whitespace-cleanup)

(setopt use-short-answers t)
(setq package-native-compile    t
      display-line-numbers-type 'relative
      backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory))))

(if (fboundp 'set-fringe-mode) (set-fringe-mode 10))
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'global-display-line-numbers-mode) (global-display-line-numbers-mode 1))

;; ------------
;; Includes
;; ------------
