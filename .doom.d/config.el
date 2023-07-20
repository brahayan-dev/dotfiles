;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identity:
(setq user-full-name "Brahayan Xavier"
      user-mail-address "brahayan@live.com")

;; Theme:
(setq doom-theme 'doom-one-light)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/Projects/writtings/")
(setq doom-font (font-spec :family "Fira Code" :size 18)
      doom-unicode-font doom-font
      read-process-output-max (* 1024 1024))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Behavior:
(setq project-enable-caching nil
      projectile-project-search-path '("~/Projects"))
