;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       vertico             ; the search engine of the future
       (corfu +icons
              +dabbrev
              +orderless)  ; complete with cap(f), cape and a flying feather!
       ;;company           ; the ultimate code completion backend
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       ;;ivy               ; a search engine for love and life

       :ui
       doom                ; what makes DOOM look the way it does
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       unicode             ; extended unicode support for various languages
       ophints             ; highlight the region an operation acts on
       modeline            ; snazzy, Atom-inspired modeline, plus API
       workspaces          ; tab emulation, persistence & separate workspaces
       doom-dashboard      ; a nifty splash screen for Emacs
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       (ligatures +fira)   ; ligatures and symbols to make your code pretty again
       (vc-gutter +pretty) ; vcs diff in the fringe
       ;;doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;(emoji +unicode)  ; 🙂
       ;;deft              ; notational velocity for Emacs
       ;;indent-guides     ; highlighted indent columns
       ;;minimap           ; show a map of the code on the side
       ;;nav-flash         ; blink cursor line after big motions
       ;;neotree           ; a project drawer, like NERDTree for vim
       ;;tabs              ; a tab bar for Emacs
       ;;treemacs          ; a project drawer, like neotree but cooler
       ;;window-select     ; visually switch windows
       ;;zen               ; distraction-free coding or writing

       :editor
       fold                ; (nigh) universal code folding
       snippets            ; my elves. They type so I don't have to
       word-wrap           ; soft wrapping with language-aware indent
       file-templates      ; auto-snippets for empty files
       (format +onsave)    ; automated prettiness
       (evil +everywhere)  ; come to the dark side, we have cookies
       ;;god               ; run Emacs commands without modifier keys
       ;;lispy             ; vim for lisp, for people who don't like vim
       ;;multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;;rotate-text       ; cycle region at point between text candidates

       :emacs
       vc                  ; version-control and Emacs, sitting in a tree
       undo                ; persistent, smarter undo for your inevitable mistakes
       dired               ; making dired pretty [functional]
       electric            ; smarter, keyword-based electric-indent
       ;;eww               ; the internet is gross
       ;;ibuffer           ; interactive buffer management

       :term
       vterm               ; the best terminal emulation in Emacs
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;(spell +flyspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       lsp                 ; M-x vscode
       magit               ; a git porcelain for Emacs
       direnv
       docker
       lookup              ; navigate your code and its documentation
       ansible
       tree-sitter         ; syntax and parsing, sitting in a tree...
       (eval +overlay)     ; run code, run (also, repls)
       ;;ein               ; tame Jupyter notebooks with emacs
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;collab            ; buffers with friends
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if (featurep :system 'macos) macos)  ; improve compatibility with macOS
       tty                                    ; improve the terminal Emacs experience

       :lang
       org                            ; organize your plain life in plain text
       data                           ; config/data formats
       json                           ; At least it ain't XML
       emacs-lisp                     ; drown in parentheses
       (markdown +grip)               ; writing docs for people to ignore
       (scala +lsp
              +tree-sitter)           ; java, but good
       (sh +lsp +tree-sitter)         ; she sells {ba,z,fi}sh shells on the C xor
       (web +lsp +tree-sitter)        ; the tubes
       (yaml +lsp +tree-sitter)       ; JSON, but readable
       (javascript +lsp
                   +tree-sitter)      ; all(hope(abandon(ye(who(enter(here))))))
       (clojure +lsp
                +tree-sitter)         ; java with a lisp
       (:if (string= "work" (getenv "WORKSPACE"))
           (dart +lsp
                 +flutter))           ; paint ui and not much else
       ;;(ruby +lsp
       ;;      +tree-sitter)          ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;(python +lsp
       ;;        +pyenv
       ;;        +tree-sitter)        ; beautiful is better than ugly
       ;;agda                         ; types of types of types of types...
       ;;beancount                    ; mind the GAAP
       ;;(cc +lsp)                    ; C > C++ == 1
       ;;(common-lisp)                ; if you've seen one lisp, you've seen them all
       ;;coq                          ; proofs-as-programs
       ;;crystal                      ; ruby at the speed of c
       ;;csharp                       ; unity, .NET, and mono shenanigans
       ;;dhall
       ;;(elixir +lsp)                ; erlang done right
       ;;(elm +lsp
       ;;     +tree-sitter)           ; care for a cup of TEA?
       ;;erlang                       ; an elegant language for a more civilized age
       ;;ess                          ; emacs speaks statistics
       ;;factor
       ;;faust                        ; dsp, but you get to keep your soul
       ;;fortran                      ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp                       ; ML stands for Microsoft's Language
       ;;fstar                        ; (dependent) types and (monadic) effects and Z3
       ;;gdscript                     ; the language you waited for
       ;;(go +lsp)                    ; the hipster dialect
       ;;(graphql +lsp)               ; Give queries a REST
       ;;(haskell +lsp)               ; a language that's lazier than I am
       ;;hy                           ; readability of scheme w/ speed of python
       ;;idris                        ; a language you can depend on
       ;;(java +lsp)                  ; the poster child for carpal tunnel syndrome
       ;;julia                        ; a better, faster MATLAB
       ;;kotlin                       ; a better, slicker Java(Script)
       ;;(latex +lsp
       ;;       +cdlatex
       ;;       +latexmk)             ; writing papers in Emacs has never been so fun
       ;;lean                         ; for folks with too much to prove
       ;;ledger                       ; be audit you can number-to-string
       ;;(lua +lsp
       ;;     +tree-sitter)           ; one-based indices? one-based indices
       ;;nim                          ; python + lisp at the speed of c
       ;;nix                          ; I hereby declare "nix geht mehr!"
       ;;ocaml                        ; an objective camel
       ;;php                          ; perl's insecure younger brother
       ;;plantuml                     ; diagrams for confusing people more
       ;;graphviz                     ; diagrams for confusing yourself even more
       ;;purescript                   ; javascript, but functional
       ;;qt                           ; the 'cutest' gui framework ever
       ;;racket                       ; a DSL for DSLs
       ;;raku                         ; the artist formerly known as perl6
       ;;rest                         ; Emacs as a REST client
       ;;rst                          ; ReST in peace
       ;;(rust +lsp)                  ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;(scheme +chez)               ; a fully conniving family of lisps
       ;;sml
       ;;solidity                     ; do you need a blockchain? No.
       ;;swift                        ; who asked for emoji variables?
       ;;terra                        ; Earth and Moon in alignment for performance.
       ;;zig                          ; C, but simpler

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       (rss +org)          ; emacs as an RSS reader

       :config
       ;;literate
       (default +bindings +smartparens))
