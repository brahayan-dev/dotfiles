;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;;;; ------------------------------------------------------------
;;;; Package system
;;;; ------------------------------------------------------------

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)

(setq use-package-always-ensure t
      use-package-verbose t
      use-package-minimum-reported-time 0)

;;;; ------------------------------------------------------------
;;;; UI / UX
;;;; ------------------------------------------------------------

(setq display-line-numbers-type 'relative)
(setq frame-resize-pixelwise t)
(global-display-line-numbers-mode 1)

(setq-default indent-tabs-mode nil)
(global-auto-revert-mode 1)

(set-face-attribute 'default nil
                    :height 190
                    :family "Fira Code"
                    :weight 'regular)

(if (fboundp 'toggle-frame-fullscreen) (toggle-frame-fullscreen))

(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

;;;; ------------------------------------------------------------
;;;; Encoding
;;;; ------------------------------------------------------------

(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;;;; ------------------------------------------------------------
;;;; Native compilation
;;;; ------------------------------------------------------------

(setq comp-num-cpus 4)
(setq comp-deferred-compilation t)

;;;; ------------------------------------------------------------
;;;; Theme
;;;; ------------------------------------------------------------

(use-package ef-themes
  :init
  (ef-themes-take-over-modus-themes-mode 1)
  :config
  (setq modus-themes-mixed-fonts t)
  (setq modus-themes-italic-constructs t)
  (modus-themes-load-theme 'ef-deuteranopia-light))

;;;; ------------------------------------------------------------
;;;; Movements, Modes & Structural Edition
;;;; ------------------------------------------------------------

(use-package xah-fly-keys
  :load-path "~/.emacs.d/lisp/xah-fly-keys"
  :ensure nil
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1))

(use-package puni
  :defer t
  :init
  (puni-global-mode))

(use-package avy
  :bind (("M-j" . avy-goto-char-timer)
         :map isearch-mode-map
         ("C-'" . avy-search)))

;;;; ------------------------------------------------------------
;;;; Abbrev, Vertico, Corfu & Cape
;;;; ------------------------------------------------------------

(use-package abbrev
  :diminish
  :hook ((text-mode prog-mode) . abbrev-mode)
  :custom
  ;; Set the name of file from which to read abbrevs.
  (abbrev-file-name "~/.config/emacs/abbrev_defs")
  ;; Silently save word abbrevs too when files are saved.
  (save-abbrevs 'silently))

(use-package corfu
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("C-<tab>" . corfu-previous))
  :custom
  (corfu-cycle t)
  (corfu-preselect 'first)
  :hook ((after-init . global-corfu-mode)))

(use-package cape
  :defer t
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))

(use-package vertico
  :hook (after-init . vertico-mode)
  :custom
  (vertico-cycle t))

;;;; ------------------------------------------------------------
;;;; Languages
;;;; ------------------------------------------------------------

(use-package arei
  :commands (arei))

(use-package geiser
  :commands (geiser run-geiser))

(use-package scheme
  :mode (("\\.scm\\'" . scheme-mode))
  :custom
  (scheme-program-name "guile"))

(use-package js
  :mode "\\.js\\'"
  :custom
  (js-indent-level 2))

(use-package yaml-mode
  :mode (("\\.yaml\\'" . yaml-mode)
         ("\\.yaml.tmpl\\'" . yaml-mode)
         ("\\.yml\\'" . yaml-mode)))

;;;; ------------------------------------------------------------
;;;; Eglot
;;;; ------------------------------------------------------------

(use-package eglot
  :defer t
  :config
  (add-to-list 'eglot-server-programs '(scheme-mode . ("guile-lsp-server")))
  :custom
  (eglot-connect-timeout 120)
  (eglot-extend-to-xref t))

;;;; ------------------------------------------------------------
;;;; Vterm, Dired & Magit
;;;; ------------------------------------------------------------

(use-package dired
  :bind (("C-x C-d" . dired))
  :commands (dired)
  :custom
  ;; Try to guess a default target directory.
  (dired-dwim-target t)
  ;; Switches passed to `ls' for Dired. MUST contain the `l' option.
  (dired-listing-switches "-alh"))

(use-package magit
  :bind (("C-x C-g s" . magit-status))
  :config
  (setq magit-stage-all-confirm nil)
  (setq magit-unstage-all-confirm nil)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  ;; Performance optimizations for magit-revision buffer
  (setq magit-revision-insert-related-refs nil)
  (setq magit-diff-refine-hunk t))

(use-package vterm
  :commands (vterm)
  :custom
  (vterm-max-scrollback 100000))

(use-package clipetty
  :ensure t
  :bind ("M-w" . clipetty-kill-ring-save))

;;;; ------------------------------------------------------------
;;;; Custom file
;;;; ------------------------------------------------------------

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;;; ------------------------------------------------------------
;;;; Restore GC after startup
;;;; ------------------------------------------------------------

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

;;; init.el ends here
