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
