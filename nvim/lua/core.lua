local function load_lualine()
	local lualine = require("lualine")
	
	return lualine.setup({
		options = {
			theme = "papercolor_dark"
		}
	})
end

local function load_theme()
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

local function load_modes()
	local modes = require('modes')
	return modes.setup({
		set_cursorline = false
	})
end

return {
  {"folke/lazy.nvim", version = "*"},
  {'folke/tokyonight.nvim', config = load_theme},
  {'nvim-lualine/lualine.nvim', config = load_lualine},
  {'mvllow/modes.nvim', tag = 'v0.2.0', config = load_modes},
}
