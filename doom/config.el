;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ---------
;; Themes
;; ---------
(setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-miramare)

;; ------
;; Doom
;; ------
(setq doom-symbol-font doom-font
      doom-localleader-key ","
      doom-font (font-spec :family "JetBrains Mono" :size 18))

;; ---------
;; Editor
;; ---------
(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))
(setq no-byte-compile nil
      project-enable-caching nil
      frame-resize-pixelwise t
      package-native-compile t
      display-line-numbers-type 'relative
      org-directory "~/Projects/workbooks/"
      read-process-output-max (* 1024 1024)
      projectile-project-search-path '("~/Projects")
      backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/" user-emacs-directory))))

;; ------
;; Hook
;; ------
(add-hook 'before-save-hook #'whitespace-cleanup)

;; ---------
;; Latex
;; ---------
(use-package! tex
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq-default TeX-master nil)
  (setq TeX-auto-save t
        TeX-parse-self t
        prettify-symbols-mode nil
        font-latex-fontify-script nil
        font-latex-fontify-sectioning 1.0
        font-latex-fontify-sectioning 'color))

;; ------
;; Lsp
;; ------
(use-package! lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t)
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
