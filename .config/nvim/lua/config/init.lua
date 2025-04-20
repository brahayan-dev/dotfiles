-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
do
  local options = {number = true, relativenumber = true, ignorecase = true, smartcase = true, cursorline = true, expandtab = true, tabstop = 4, shiftwidth = 4, softtabstop = 4, scrolloff = 10, splitright = true, splitbelow = true, timeoutlen = 300, breakindent = true, undofile = true, showmode = false}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
do
  local options = {have_nerd_font = true}
  for option, value in pairs(options) do
    core.assoc(vim.g, option, value)
  end
end
local function _2_()
  return core.assoc(vim.o, "clipboard", "unnamedplus")
end
vim.schedule(_2_)
return {}
