;;; init.el -*- lexical-binding: t; -*-
;;; init.el --- My Emacs configuration. -*- lexical-binding: t; -*-

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

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))
