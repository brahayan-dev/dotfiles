;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Variables
(defvar current-workspace (getenv "WORKSPACE"))

;; Theme
;; (setq doom-theme 'doom-bluloco-light)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-nord-aurora)
;; (setq doom-theme 'doom-tokyo-night)
;; (setq doom-theme 'doom-monokai-pro)
(setq doom-theme 'doom-dracula)

;; Doom Configuration
(setq doom-localleader-key ",")
(setq doom-symbol-font doom-font)
(setq doom-modeline-buffer-file-name-style 'truncate-all)

;; Editor Configuration
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(setq no-byte-compile nil)
(setq vterm-shell "/bin/zsh")
(setq evil-move-beyond-eol t)
(setq frame-resize-pixelwise t)
(setq package-native-compile t)
(setq projectile-enable-caching nil)
(setq org-directory "~/.dotfiles/doom/")
(setq display-line-numbers-type 'relative)
(setq read-process-output-max (* 1024 1024))
(setq backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory))))
(setq projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-bottom-up
                                          projectile-root-top-down-recurring))

;; LSP Configuration
(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-copilot-enabled t)
  (setq lsp-semantic-tokens-enable t)
  (setq lsp-inline-completion-idle-delay 1))

;; Hooks
(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(add-hook! 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook! 'clojurescript-mode-hook #'evil-cleverparens-mode)
(add-hook! 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

(add-hook! 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook! 'clojurescript-mode-hook #'smartparens-strict-mode)
(add-hook! 'emacs-lisp-mode-hook #'smartparens-strict-mode)

;; Key Mappings
(map! :v
      "M-r" #'evil-multiedit-match-all
      "M-d" #'evil-multiedit-match-and-next
      "M-D" #'evil-multiedit-match-and-prev)

(after! lsp-mode
  (map! :map lsp-mode-map
        :n "M-l" #'lsp
        :i "C-0" (lambda ()
                   (interactive)
                   (corfu-quit)
                   (lsp-inline-completion-display))))

(after! evil-cleverparens
  (map! :map evil-cleverparens-mode-map
        :n "[[" #'evil-cp-beginning-of-defun
        :n "]]" #'evil-cp-end-of-defun))

;; Workspace Configuration
(when (string= current-workspace "akeptous")
  (setq projectile-project-search-path '("~/Projects" "~/Akeptous"))
  (when (equal system-type 'gnu/linux)
    (setq doom-font (font-spec :family "Fira Code" :size 16)))
  (when (equal system-type 'darwin)
    (setq doom-font (font-spec :family "Fira Code" :size 18))))

(when (string= current-workspace "work")
  (setq doom-font (font-spec :family "Fira Code" :size 18))
  (setq projectile-project-search-path '("~/Projects" "~/dev/nu/"))

  (let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
    (when (file-directory-p nudev-emacs-path)
      (add-to-list 'load-path nudev-emacs-path)
      (require 'nu nil t))))
