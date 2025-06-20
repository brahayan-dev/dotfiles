;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ---------
;; Themes
;; ---------
;; (setq doom-theme 'doom-bluloco-light)
(setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-nord-aurora)
;; (setq doom-theme 'doom-dracula)

;; ------
;; Doom
;; ------
(setq doom-localleader-key ","
      doom-symbol-font doom-font
      doom-font (font-spec :family "Fira Code" :size 18)
      doom-modeline-buffer-file-name-style 'truncate-all)

;; ---------
;; Editor
;; ---------
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(setq no-byte-compile nil
      frame-resize-pixelwise t
      package-native-compile t
      projectile-enable-caching nil
      display-line-numbers-type 'relative
      vterm-shell "/bin/zsh"
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

;; ---------
;; Paredit
;; ---------
(use-package! paredit
  :diminish
  :ensure t
  ;; Bind RET to nil, to fix Cider REPL buffer eval issue
  :bind (:map paredit-mode-map ("RET" . nil))
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)
         (clojurescript-mode . paredit-mode)))

(after! paredit
  (define-key paredit-mode-map (kbd "C-<left>") nil)
  (define-key paredit-mode-map (kbd "C-<right>") nil)
  (map! :nvi
        :desc "Forward barf"
        "M-<left>" #'paredit-forward-barf-sexp
        :desc "Forward slurp"
        "M-<right>" #'paredit-forward-slurp-sexp
        :desc "Backward slurp"
        "M-S-<left>" #'paredit-backward-slurp-sexp
        :desc "Backward barf"
        "M-S-<right>" #'paredit-backward-barf-sexp
        :desc "Backward"
        "C-c <left>" #'paredit-backward
        :desc "Forward"
        "C-c <right>" #'paredit-forward))

;; ------
;; OS
;; ------
(when (equal system-type 'darwin)
  (let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
    (when (file-directory-p nudev-emacs-path)
      (add-to-list 'load-path nudev-emacs-path)
      (require 'nu nil t))))

(when (equal system-type 'gnu/linux)
  (setq projectile-project-search-path '("~/Akeptous")))
