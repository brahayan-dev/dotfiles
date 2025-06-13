;;; init.el --- Configuration -*- lexical-binding: t; -*-

(setopt inhibit-splash-screen t)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'toggle-frame-fullscreen)
  (toggle-frame-fullscreen))
(when (fboundp 'global-display-line-numbers-mode)
  (global-display-line-numbers-mode 1))

;; (load-theme 'modus-vivendi-tritanopia t)
(load-theme 'misterioso t)
(set-face-attribute 'default nil
                    :height 120
		    :family "Fira Code")

(setq make-backup-files nil)
(setq display-line-numbers-type 'relative)
(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))

(setq comp-num-cpus 4)
(setq comp-deferred-compilation t)
(setq native-comp-async-report-warnings-errors nil)

(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(require 'package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-verbose t)
(setq use-package-minimum-reported-time 0)
(setq use-package-always-ensure t)

(load-file "~/.config/emacs/+common.el")
