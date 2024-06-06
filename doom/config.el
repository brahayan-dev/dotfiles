;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identity:
(setq user-full-name "Brahayan Xavier"
      user-mail-address "brahayan@live.com")

;; Light themes:
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-bluloco-light)
;; (setq doom-theme 'doom-gruvbox-light)

;; Dark themes:
(setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-ayu-dark)
;; (setq doom-theme 'doom-miramare)

;; Configuration:
;; (setq display-line-numbers-type 't)
(setq +latex-viewers '(skim.app))
(setq display-line-numbers-type 'relative)
(setq org-directory "~/Projects/writtings/")
(setq doom-font (font-spec :family "JetBrains Mono" :size 18)
      doom-symbol-font doom-font
      read-process-output-max (* 1024 1024))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Behavior:
(setq doom-localleader-key ","
      project-enable-caching nil
      no-byte-compile nil
      projectile-project-search-path '("~/Projects"))
(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t)
  (add-hook 'lsp-after-apply-edits-hook (lambda (&rest _) (save-buffer))))
