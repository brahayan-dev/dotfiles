local M = {}

function M.setup()
	local lualine = require("lualine")

	return lualine.setup({
		options = {
			icons_enabled = false,
			theme = "papercolor_dark"
		}
	})
end

return M
