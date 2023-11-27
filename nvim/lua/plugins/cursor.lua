local M = {}

local is_night = false

function M.setup()
	local modes = require('modes')
	return modes.setup({
		set_cursorline = false,
		colors = {
			insert = require("settings").select_gutter_color(is_night)
		}
	})
end

return M
