;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(defvar current-workspace (getenv "WORKSPACE"))

;; ---------
;; Themes
;; ---------
;; (setq doom-theme 'doom-bluloco-light)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-nord-aurora)
(setq doom-theme 'doom-tokyo-night)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'doom-dracula)

;; ------
;; Doom
;; ------
(setq doom-localleader-key ","
      doom-symbol-font doom-font
      doom-modeline-buffer-file-name-style 'truncate-all)

;; ---------
;; Editor
;; ---------
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(setq no-byte-compile nil
      vterm-shell "/bin/zsh"
      frame-resize-pixelwise t
      package-native-compile t
      projectile-enable-caching nil
      org-directory "~/.dotfiles/doom/"
      display-line-numbers-type 'relative
      read-process-output-max (* 1024 1024)
      backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory)))
      projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-bottom-up
                                          projectile-root-top-down-recurring))

;; ------
;; Hook
;; ------
(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(add-hook! 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook! 'clojurescript-mode-hook #'evil-cleverparens-mode)
(add-hook! 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

;; ------
;; Lsp
;; ------
(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t
        lsp-warn-no-matched-clients nil)
  (add-hook 'lsp-after-apply-edits-hook
            (lambda (&rest _) (save-buffer))))

;; ------------
;; Workspace
;; ------------
(when (string= current-workspace "akeptous")
  (setq projectile-project-search-path '("~/Projects" "~/Akeptous"))
  (when (equal system-type 'gnu/linux)
    (setq doom-font (font-spec :family "Fira Code" :size 16)))
  (when (equal system-type 'darwin)
    (setq doom-font (font-spec :family "Fira Code" :size 18))))

(when (string= current-workspace "work")
  (setq doom-font (font-spec :family "Fira Code" :size 18)
        projectile-project-search-path '("~/Projects" "~/dev/nu/"))

  (let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
    (when (file-directory-p nudev-emacs-path)
      (require 'nu nil t)
      (add-to-list 'load-path nudev-emacs-path))))
