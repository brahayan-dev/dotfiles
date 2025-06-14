;;; +common.el --- Common Configuration -*- lexical-binding: t; -*-

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
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))

(use-package eglot
  :hook
  (ruby-mode . eglot-ensure)
  (ruby-ts-mode . eglot-ensure)
  (yaml-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  (bash-ts-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '((sh-mode bash-ts-mode) . ("bash-language-server" "start")))
  (setq-default eglot-workspace-configuration
		'((:rubyLsp . ((formatting . (:enabled t))))))
  :custom
  (eglot-connect-timeout 120)
  (eglot-extend-to-xref t))

(use-package project)

(use-package magit)

(use-package yaml-mode
  :mode (("\\.yaml\\'" . yaml-mode)
         ("\\.yml\\'" . yaml-mode)))

(use-package ruby-mode
  :mode (("Capfile\\'" . ruby-mode)
         ("Gemfile\\'" . ruby-mode)
         ("Guardfile\\'" . ruby-mode)
         ("Rakefile\\'" . ruby-mode)
         ("Vagrantfile\\'" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode)
         ("\\.rake\\'" . ruby-mode)
         ("\\.ru\\'" . ruby-mode)))
