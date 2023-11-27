local M = {}

local is_night = false
local name = "tokyonight"

local function select_style()
	if is_night then
		return "day"
	else
		return "night"
	end
end

function M.setup()
	local theme = require(name)
	theme.setup({
		transparent = true,
		terminal_colors = true,
		style = select_style(),
		styles = {
			floats = "dark", 
			sidebars = "dark",
			comments = {italic = true},
			keywords = {italic = true}
		},
		on_colors = function(colors)
    			colors.fg_gutter = require("settings").select_gutter_color(is_night)
  		end
	})
	
	return vim.cmd("colorscheme " .. name)
end

return M
