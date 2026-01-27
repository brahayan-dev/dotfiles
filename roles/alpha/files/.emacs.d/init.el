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
;;;; Modes & Structural edition
;;;; ------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/lisp/xah-fly-keys")
(use-package xah-fly-keys
  :ensure nil
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1))

(use-package puni
  :defer t
  :init
  (puni-global-mode))

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
