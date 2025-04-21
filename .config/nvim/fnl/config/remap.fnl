(let [mappings [{;; Clear highlights on search when pressing <Esc> in normal mode
                 :mode "n"
                 :lhs "<Esc>"
                 :rhs "<cmd>nohlsearch<CR>"
                 :opts {}}
                {;; Diagnostic keymaps
                 :mode "n"
                 :lhs "<leader>q"
                 :rhs vim.diagnostic.setloclist
                 :opts {:desc "Open diagnostic [Q]uickfix list"}}
                {;; Exit terminal mode in the builtin terminal with a shortcut that is a bit easier for people to discover
                 :mode "t"
                 :lhs "<Esc><Esc>"
                 :rhs "<C-\\><C-n>"
                 :opts {:desc "Exit terminal mode"}}
                ;; Disable arrow keys in normal mode
                {:mode "n"
                 :lhs "<right>"
                 :rhs "<cmd>echo \"Use l to move\"<CR>"
                 :opts {}}
                {:mode "n"
                 :lhs "<up>"
                 :rhs "<cmd>echo \"Use k to move\"<CR>"
                 :opts {}}
                {:mode "n"
                 :lhs "<down>"
                 :rhs "<cmd>echo \"Use j to move\"<CR>"
                 :opts {}}
                {:mode "n"
                 :lhs "<left>"
                 :rhs "<cmd>echo \"Use h to move\"<CR>"
                 :opts {}}
                ;; Keybinds to make split navigation easier
                {:mode "n"
                 :lhs "<C-h>"
                 :rhs "<C-w><C-h>"
                 :opts {:desc "Move focus to the left window"}}
                {:mode "n"
                 :lhs "<C-j>"
                 :rhs "<C-w><C-j>"
                 :opts {:desc "Move focus to the lower window"}}
                {:mode "n"
                 :lhs "<C-k>"
                 :rhs "<C-w><C-k>"
                 :opts {:desc "Move focus to the upper window"}}
                {:mode "n"
                 :lhs "<C-l>"
                 :rhs "<C-w><C-l>"
                 :opts {:desc "Move focus to the right window"}}]]
  (each [_ {: mode : lhs : rhs : opts} (ipairs mappings)]
    (vim.keymap.set mode lhs rhs options)))

{}
