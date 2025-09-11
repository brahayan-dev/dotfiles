;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Theme
;; (setq doom-theme 'doom-bluloco-light)
(setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-nord-aurora)
;; (setq doom-theme 'doom-tokyo-night)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'doom-dracula)

;; Doom Configuration
(setq doom-localleader-key ","
      doom-symbol-font doom-font
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
      projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-bottom-up
                                          projectile-root-top-down-recurring))

(use-package! lsp-mode
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

(use-package! smartparens
  :hook ((clojure-mode clojurescript-mode emacs-lisp-mode) . smartparens-strict-mode))

(use-package! evil-cleverparens
  :hook ((clojure-mode clojurescript-mode emacs-lisp-mode) . evil-cleverparens-mode)
  :config
  (map! :map evil-cleverparens-mode-map
        :n "[[" #'evil-cp-beginning-of-defun
        :n "]]" #'evil-cp-end-of-defun))

(after! clojure-mode
  (add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode)))

;; Hooks
(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

;; Key Mappings
(map! :v
      "M-r" #'evil-multiedit-match-all
      "M-d" #'evil-multiedit-match-and-next
      "M-D" #'evil-multiedit-match-and-prev)

;; Workspace Configuration
(setq doom-font (font-spec :family "Fira Code" :size 18)
      projectile-project-search-path '("~/Projects" "~/dev/nu/"))

(let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
  (when (file-directory-p nudev-emacs-path)
    (add-to-list 'load-path nudev-emacs-path)
    (require 'nu nil t)))
