local M = {}

local function load_lsp_keymaps()
	vim.api.nvim_create_autocmd("LspAttach", {
	  desc = "LSP keymaps",

	  callback = function()
	    local nmap = function(key, fun, desc)
	      vim.keymap.set("n", key, fun, {buffer = true, noremap = false, desc = "LSP: " .. desc})
	    end

	    nmap("K", vim.lsp.buf.hover, "hover documentation (K)")

	    nmap("gn", vim.lsp.buf.declaration, "[g]o to [n]ame")
	    nmap("gt", vim.lsp.buf.type_definition, "[g]o to [t]ype")
	    nmap("gp", vim.lsp.buf.signature_help, "[g]o to [p]rops")
	    nmap("gr", vim.lsp.buf.references, "[g]o to [r]eferences")
	    nmap("gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
	    nmap("gg", vim.diagnostic.open_float, "[g]o to dia[g]nostic")
	    nmap("gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation")

	    nmap("<leader>o", vim.lsp.buf.format, "f[o]rmatting")
	    nmap("<leader>r", vim.lsp.buf.rename, "[r]ename symbols")
	    nmap("<leader>a", vim.lsp.buf.code_action, "code [a]ctions")
	  end
	})
end

function M.setup()
	load_lsp_keymaps()
end

return M
