local M = {}

function M.load_lualine()
	local lualine = require("lualine")
	
	return lualine.setup({
		options = {
			icons_enabled = false,
			theme = "papercolor_dark"
		}
	})
end

function M.load_theme()
	local name = "tokyonight"
	local theme = require(name)
	theme.setup({
		style = "day",
		transparent = true,
		terminal_colors = true,
		styles = {
			floats = "dark", 
			sidebars = "dark",
			comments = {italic = true},
			keywords = {italic = true}
		},
		on_colors = function(colors)
    			colors.fg_gutter = "#F8DE67"
  		end
	})
	
	return vim.cmd("colorscheme " .. name)
end

function M.load_modes()
	local modes = require('modes')
	return modes.setup({
		set_cursorline = false,
		colors = {
			-- insert = "#F8DE67"
		}
	})
end

return M
