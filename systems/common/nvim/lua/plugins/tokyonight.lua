return {
  "folke/tokyonight.nvim",
  lazy = false,
  name = "tokyonight",
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("tokyonight").setup({
      styles = {
        comments = { italic = true },
      },
    })
    vim.cmd.colorscheme "tokyonight-night"
    -- vim.cmd.colorscheme "tokyonight-day"
  end
}
