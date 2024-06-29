;;; init.el --- The Emacs init file. -*- lexical-binding: t; -*-

;; ------------
;; Disablings
;; ------------
(setq inhibit-startup-message   t
      frame-resize-pixelwise    t
      package-native-compile    t
      initial-scratch-message   nil

      )

(if (fboundp 'visible-bell) (visible-bell -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))

(setq backup-by-copying t)
(setq backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory))))

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
(setq
package-enable-at-startup t
 display-line-numbers-type 'relative)

;; ------------
;; Includes
;; ------------
(setq package-file (expand-file-name "~/.emacs.d/packages.el"))
(when (file-exists-p package-file)
  (load package-file))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
