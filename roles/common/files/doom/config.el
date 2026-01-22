;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(defvar current-workspace (getenv "WORKSPACE"))

;; Theme
(setq doom-theme 'doom-bluloco-light)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-tokyo-night)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'doom-dracula)

;; Doom Configuration
(setq doom-localleader-key ","
      doom-symbol-font doom-font
      doom-font (font-spec :family "Fira Code" :size 18)
      doom-modeline-buffer-file-name-style 'truncate-all)

;; Editor Configuration
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(setq no-byte-compile nil
      vterm-shell "/bin/zsh"
      evil-move-beyond-eol t
      frame-resize-pixelwise t
      package-native-compile t
      projectile-enable-caching nil
      org-directory "~/.dotfiles/doom/"
      display-line-numbers-type 'relative
      read-process-output-max (* 1024 1024)
      backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory)))
      projectile-project-search-path '("~/Projects" "~/dev/nu/")
      projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-bottom-up
                                          projectile-root-top-down-recurring))

(use-package! lsp-mode
  :defer t
  :commands lsp
  :config
  (setq lsp-copilot-enabled t
        lsp-semantic-tokens-enable t
        lsp-inline-completion-idle-delay 1)
  (map! :map lsp-mode-map
        :n "M-l" #'lsp
        :i "C-0" (lambda ()
                   (interactive)
                   (corfu-quit)
                   (lsp-inline-completion-display))))

(use-package! evil-cleverparens-mode
  :defer t
  :hook ((emacs-lisp-mode scheme-mode clojure-mode clojurescript-mode) . evil-cleverparens-mode))

(after! clojure-mode
  (add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode)))

(when (string= current-workspace "work")
  (let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
    (when (file-directory-p nudev-emacs-path)
      (add-to-list 'load-path nudev-emacs-path)
      (require 'nu nil t))))

(defun load-guile-lib (path)
  (after! geiser-guile
    (add-to-list 'geiser-guile-load-path (expand-file-name path))))

(when (featurep :system 'macos)
  (load-guile-lib "/opt/homebrew/opt/guile/share/guile/3.0")
  (load-guile-lib "/opt/homebrew/opt/haunt/share/guile/site/3.0"))

(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'smartparens-mode-hook #'evil-cleverparens-mode)

;; Key Mappings
(map! :v
      "M-r" #'evil-multiedit-match-all
      "M-d" #'evil-multiedit-match-and-next
      "M-D" #'evil-multiedit-match-and-prev)
