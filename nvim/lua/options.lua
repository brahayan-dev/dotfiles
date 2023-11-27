local M = {}

local options = {
	wrap = false,
	number = true,
	undofile = true,
	expandtap = true,
	smartcase = true,
	ignorecase = true,
	relativenumber = true,

	mouse = "",
	clipboard = "unnamedplus",
	completeopt = "menu,menuone,noselect",
	
	tabstop = 4,
	shiftwidth = 4,
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

function M.setup()
	load_vars(globals, vim.g)
	load_vars(options, vim.o)	
end

return M
