(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(let [options {:number true
               :relativenumber true
               ;; Don't show the mode, since it's already in the status line.
               :showmode false
               ;; Save undo history
               :undofile true}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

(let [options {:have_nerd_font true}]
  (each [option value (pairs options)]
    (core.assoc vim.g option value)))

;; Sync clipboard between os and neovim.
(vim.schedule (fn [] (core.assoc vim.o :clipboard "unnamedplus")))

{}
