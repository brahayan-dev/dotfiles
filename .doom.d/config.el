;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identity:
(setq user-full-name "Brahayan Xavier"
      user-mail-address "brahayan@live.com")

;; Theme:
(setq doom-theme 'doom-ayu-dark)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/Projects/writtings/")
(setq doom-font (font-spec :family "Fira Code" :size 18)
      doom-unicode-font doom-font
      read-process-output-max (* 1024 1024))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Behavior:
(setq doom-localleader-key ","
      project-enable-caching nil
      projectile-project-search-path '("~/Projects"))
(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t)
  (add-hook 'lsp-after-apply-edits-hook (lambda (&rest _) (save-buffer))))
