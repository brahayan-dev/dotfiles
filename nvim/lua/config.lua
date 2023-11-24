local M = {}

local options = {
	wrap = false,
	number = true,
	expandtap = true,
	relativenumber = true,
	clipboard = "unnamedplus",
	shiftwidth = 4,
	tabstop = 4
}

local globals = {
	mapleader = " ",
	maplocalleader = ","
}

local function load_vars(items, place)
	for item, value in pairs(items) do
		place[item] = value
	end
end

local function load_keymaps()
	vim.api.nvim_create_autocmd('LspAttach', {
	  desc = 'Acciones LSP',
	  callback = function()
	    local bufmap = function(mode, lhs, rhs)
	      local opts = {buffer = true}
	      vim.keymap.set(mode, lhs, rhs, opts)
	    end
	
	    -- Muestra información sobre símbolo debajo del cursor
	    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
	
	    -- Saltar a definición
	    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
	
	    -- Saltar a declaración
	    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
	
	    -- Mostrar implementaciones
	    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
	
	    -- Saltar a definición de tipo
	    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
	
	    -- Listar referencias
	    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
	
	    -- Mostrar argumentos de función
	    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
	
	    -- Mostrar diagnósticos de la línea actual
	    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
	
	    -- Renombrar símbolo
	    bufmap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>')
	
	    -- Listar "code actions" disponibles en la posición del cursor
	    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
	
	    -- Saltar al diagnóstico anterior
	    bufmap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<CR>')
	  end
	})
end 

local function load_golang_config()
	vim.api.nvim_create_autocmd("BufWritePre", {
	  pattern = "*.go",
	  callback = function()
	    local params = vim.lsp.util.make_range_params()
	    params.context = {only = {"source.organizeImports"}}
	    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
	    -- machine and codebase, you may want longer. Add an additional
	    -- argument after params if you find that you have to write the file
	    -- twice for changes to be saved.
	    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
	    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
	    for cid, res in pairs(result or {}) do
	      for _, r in pairs(res.result or {}) do
	        if r.edit then
	          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
	          vim.lsp.util.apply_workspace_edit(r.edit, enc)
	        end
	      end
	    end
	    vim.lsp.buf.format({async = false})
	  end
	})
end

function M.enable()
	load_vars(globals, vim.g)
	load_vars(options, vim.o)
	load_keymaps()
	load_golang_config()
end

return M
