;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ---------
;; Themes
;; ---------
;; (setq doom-theme 'doom-bluloco-light)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-ayu-light)
(setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-nord-aurora)
;; (setq doom-theme 'doom-dracula)

;; ------
;; Doom
;; ------
(setq doom-localleader-key ","
      doom-symbol-font doom-font
      ;; doom-modeline-buffer-file-name-style 'truncate-all
      doom-modeline-buffer-file-name-style 'file-name
      doom-font (font-spec :family "FiraCode Nerd Font" :size 18))

;; ---------
;; Editor
;; ---------
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(setq no-byte-compile nil
      frame-resize-pixelwise t
      package-native-compile t
      projectile-enable-caching nil
      display-line-numbers-type 'relative
      org-directory "~/Projects/workbooks/"
      read-process-output-max (* 1024 1024)
      projectile-project-search-path '("~/Projects")
      backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory)))
      projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-bottom-up
                                          projectile-root-top-down-recurring))

;; ------
;; Hook
;; ------
(add-hook 'before-save-hook #'whitespace-cleanup)

;; ------
;; Lsp
;; ------
(use-package! lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t
        lsp-warn-no-matched-clients nil)
  (add-hook 'lsp-after-apply-edits-hook
            (lambda (&rest _) (save-buffer))))

