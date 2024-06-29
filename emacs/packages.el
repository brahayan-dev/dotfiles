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

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(use-package vertico
  :defer t
  :ensure t
  :init (vertico-mode))

(use-package projectile
  :ensure t
  :demand t
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

(use-package magit
  :defer t
  :ensure t
  :bind (("C-x g" . magit-status)))
