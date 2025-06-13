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
  :config
  (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) "ruby-lsp"))
  (add-to-list 'eglot-server-programs '((sh-mode bash-ts-mode) . ("bash-language-server" "start")))
  :custom
  (eglot-connect-timeout 120)
  (eglot-extend-to-xref t))
