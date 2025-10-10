;;; init.el -*- lexical-binding: t; -*-

(defvar current-workspace (getenv "WORKSPACE"))
(doom! :input

       :completion
       vertico
       (corfu +icons +dabbrev +orderless)

       :ui
       doom
       hl-todo
       unicode
       ophints
       modeline
       nav-flash
       workspaces
       doom-dashboard
       vi-tilde-fringe
       (popup +defaults)
       (ligatures +fira)
       (vc-gutter +pretty)

       :editor
       fold
       snippets
       word-wrap
       file-templates
       multiple-cursors
       (format +onsave)
       (evil +everywhere)

       :emacs
       vc
       undo
       dired
       electric

       :term
       vterm

       :checkers
       syntax

       :tools
       lsp
       magit
       direnv
       lookup
       ansible
       tree-sitter
       (eval +overlay)

       :os
       (:if (featurep :system 'macos) macos)
       tty

       :lang
       org
       data
       json
       emacs-lisp
       (markdown +grip)
       (sh +lsp +tree-sitter)
       (web +lsp +tree-sitter)
       (yaml +lsp +tree-sitter)
       (clojure +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (:if (string= current-workspace "work") (dart +lsp +flutter))
       (:if (string= current-workspace "work") (scala +lsp +tree-sitter))


       :app
       (rss +org)

       :config
       (default +bindings +smartparens))
