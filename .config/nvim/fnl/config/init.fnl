(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(let [options {:number true
               :relativenumber true
               ;; Case-insensitive searching UNLESS the search pattern contains one or more capital letters
               :ignorecase true
               :smartcase true
               ;; Show which line your cursor is on
               :cursorline true
               ;; Translate each tab to 4 spaces
               :expandtab true
               :tabstop 4
               :shiftwidth 4
               :softtabstop 4
               ;; Minimal number of screen lines to keep above and below the cursor
               :scrolloff 10
               ;; Configure how new splits should be opened
               :splitright true
               :splitbelow true
               ;; Decrease mapped sequence wait time
               ;; Displays which-key popup sooner
               :timeoutlen 300
               ;; Enable break indent
               :breakindent true
               ;; Don't show the mode, since it's already in the status line
               :showmode false
               ;; Save undo history
               :undofile true}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

(let [options {:have_nerd_font true}]
  (each [option value (pairs options)]
    (core.assoc vim.g option value)))

;; Sync clipboard between OS and Neovim.
(vim.schedule (fn [] (core.assoc vim.o :clipboard "unnamedplus")))

{}
