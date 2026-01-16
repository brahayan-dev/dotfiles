vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.autoread = true

vim.opt.swapfile = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
  desc = "Highlight when yanking (copying) text"
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  desc = "Format on save using LSP",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.pug", "*.scss", "*.json" },
  callback = function(args)
    local output = vim.fn.system({ "npx", "prettier", "--write", args.file })

    if vim.v.shell_error ~= 0 then
      vim.notify(output, vim.log.levels.ERROR)
    else
      vim.cmd("edit!")
    end
  end,
  desc = "Format current file with Prettier (sync) on save",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cabal",
  callback = function()
    vim.cmd("silent %!cabal-fmt")
  end,
})
