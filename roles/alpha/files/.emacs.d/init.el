;;; init.el --- Emacs configuration. -*- lexical-binding: t; -*-

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")))

(use-package ef-themes
  :commands (ef-themes-load-random
             ef-themes-rotate)
  :init
  (ef-themes-load-random))

(setq comp-num-cpus 4)
(setq comp-deferred-compilation t)
(global-display-line-numbers-mode t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)

(require 'package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-minimum-reported-time 0)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))
