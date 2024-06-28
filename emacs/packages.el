;;; packages.el --- The Packages file -*- lexical-binding: t; -*-

(require 'package)
(require 'use-package)

;; ------------
;; Packages
;; ------------
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
	("nongnu"       . "https://elpa.nongnu.org/nongnu/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))
