;;; init.el --- Configuration -*- lexical-binding: t; -*-

(setopt inhibit-splash-screen t)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(when (fboundp 'global-display-line-numbers-mode)
  (global-display-line-numbers-mode 1)
  (setq display-line-numbers-type 'relative))

(load-theme 'modus-vivendi-tritanopia t)
;; (load-theme 'modus-operandi-tinted t)

(set-face-attribute 'default nil
                    :height 120
		    :family "Fira Code")
