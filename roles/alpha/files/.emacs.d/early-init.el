;;; early-init.el --- Early initialization -*- lexical-binding: t; -*-

;;;; ------------------------------------------------------------
;;;; Performance (early)
;;;; ------------------------------------------------------------

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;;;; ------------------------------------------------------------
;;;; Disable GUI elements early
;;;; ------------------------------------------------------------

(add-to-list 'default-frame-alist '(horizontal-scroll-bars . nil))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))

(when (fboundp 'menu-bar-mode)  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;;;; ------------------------------------------------------------
;;;; Fonts / GC internals
;;;; ------------------------------------------------------------

(setq inhibit-compacting-font-caches t)

(add-to-list 'default-frame-alist
             '(font . "Fira Code-19"))

;;;; ------------------------------------------------------------
;;;; Package system (delegated to init.el)
;;;; ------------------------------------------------------------

(setq package-enable-at-startup nil)

;;; early-init.el ends here
