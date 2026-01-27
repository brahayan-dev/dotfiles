;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;;;; ------------------------------------------------------------
;;;; Package system
;;;; ------------------------------------------------------------

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
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
(global-display-line-numbers-mode 1)

(setq-default indent-tabs-mode nil)
(global-auto-revert-mode 1)

;;;; ------------------------------------------------------------
;;;; Native compilation
;;;; ------------------------------------------------------------

(setq comp-num-cpus 4)
(setq comp-deferred-compilation t)

;;;; ------------------------------------------------------------
;;;; Themes
;;;; ------------------------------------------------------------

(use-package ef-themes
  :commands (ef-themes-load-random ef-themes-rotate)
  :init
  (ef-themes-load-random))

;;;; ------------------------------------------------------------
;;;; Custom file (belongs here, not early-init)
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