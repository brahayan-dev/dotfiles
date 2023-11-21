local M = {}

local options = {
	number = true,
	expandtap = true,
	relativenumber = true,
	clipboard = "unnamedplus",
	wrap = false
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

function M.enable()
	load_vars(globals, vim.g)
	load_vars(options, vim.o)
end

return M
