local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)
vim.loader.enable()

require("options").setup()
require("keymaps").setup()
require("lazy").setup({
	{ --
	"ray-x/go.nvim",
	dependencies = {
    	"ray-x/guihua.lua",
    	"neovim/nvim-lspconfig",
    	"nvim-treesitter/nvim-treesitter"},
  	config = function()
    	require("go").setup()
  	end,
  	ft = {"go", 'gomod'},
  	event = {"CmdlineEnter"},
  	build = ':lua require("go.install").update_all_sync()'},

	{ --
	"L3MON4D3/LuaSnip",
	dependencies = {"rafamadriz/friendly-snippets"}},

	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-buffer"},
  	{"hrsh7th/cmp-nvim-lsp"},
	{"saadparwaiz1/cmp_luasnip"},
	{"rafamadriz/friendly-snippets"},
  	{"folke/lazy.nvim", version = "*"},

  	{ --
   	"hrsh7th/nvim-cmp",
	config = require("plugins.cmp").setup,
	dependencies = {"L3MON4D3/LuaSnip",
	   		"hrsh7th/cmp-nvim-lsp",
	   		"saadparwaiz1/cmp_luasnip"}},

	{ -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
    build = function()
    	pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
    dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"}},
  
	{"neovim/nvim-lspconfig", config = require("plugins.lsp").setup},
	{"folke/tokyonight.nvim", config = require("plugins.theme").setup},
  	{"nvim-lualine/lualine.nvim", config = require("plugins.statusline").setup},
  	{"mvllow/modes.nvim", tag = "v0.2.0", config = require("plugins.cursor").setup},
})
