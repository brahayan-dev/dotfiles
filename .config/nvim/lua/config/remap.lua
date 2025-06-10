-- [nfnl] Compiled from fnl/config/remap.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local mappings = {{mode = "n", lhs = "<Esc>", rhs = "<cmd>nohlsearch<CR>", opts = {}}, {mode = "n", lhs = "<leader>q", rhs = vim.diagnostic.setloclist, opts = {desc = "Open diagnostic [Q]uickfix list"}}, {mode = "t", lhs = "<Esc><Esc>", rhs = "<C-\\><C-n>", opts = {desc = "Exit terminal mode"}}, {mode = "n", lhs = "<C-h>", rhs = "<C-w><C-h>", opts = {desc = "Move focus to the left window"}}, {mode = "n", lhs = "<C-j>", rhs = "<C-w><C-j>", opts = {desc = "Move focus to the lower window"}}, {mode = "n", lhs = "<C-k>", rhs = "<C-w><C-k>", opts = {desc = "Move focus to the upper window"}}, {mode = "n", lhs = "<C-l>", rhs = "<C-w><C-l>", opts = {desc = "Move focus to the right window"}}}
  for _, _1_ in ipairs(mappings) do
    local mode = _1_["mode"]
    local lhs = _1_["lhs"]
    local rhs = _1_["rhs"]
    local opts = _1_["opts"]
    vim.keymap.set(mode, lhs, rhs, options)
  end
end
return {}
