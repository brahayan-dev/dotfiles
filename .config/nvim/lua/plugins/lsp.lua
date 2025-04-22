-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local function _1_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local config = require("config.lsp")
  local capabilities = cmplsp.default_capabilities()
  return lsp.clojure_lsp.setup({capabilities = capabilities, handlers = config.handlers, on_attach = config.on_attach, before_init = config.before_init})
end
return {{"neovim/nvim-lspconfig", config = _1_}}
