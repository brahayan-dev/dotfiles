;;; early-init.el --- The Early Init File. -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum)

;; Disable GUI elements early
(add-to-list 'default-frame-alist '(horizontal-scroll-bars . nil))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

(if (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(setq inhibit-startup-message t)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(setq inhibit-compacting-font-caches t)

(setq package-enable-at-startup nil)
