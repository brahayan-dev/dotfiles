local M = {}

local function load_go_format()
	local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
	  	pattern = "*.go",
	  	callback = function()
	  	 	require('go.format').goimport()
	  	end,
	  	group = format_sync_grp,
	})

	require('go').setup()
end

function M.setup()
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

	lspconfig.gopls.setup({
		capabilities = lsp_capabilities
	})
	load_go_format()
end

return M
