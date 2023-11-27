local M = {}

function M.select_gutter_color(flag)
	if flag then
		return "#F8DE67"
	else
		return "#FF6699"
	end
end

function M.setup()
	-- Load the snippets collection from runtimepath
	require('luasnip.loaders.from_vscode').lazy_load()
end

return M
