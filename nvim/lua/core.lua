local function load_lsp()
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
	
	lspconfig.gopls.setup({
		capabilities = lsp_capabilities
	})
end

return {
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"folke/lazy.nvim", version = "*"},
  {"neovim/nvim-lspconfig", config = load_lsp},
  {'folke/tokyonight.nvim', config = require("components.ui").load_theme},
  {'nvim-lualine/lualine.nvim', config = require("components.ui").load_lualine},
  {'mvllow/modes.nvim', tag = 'v0.2.0', config = require("components.ui").load_modes},
}
