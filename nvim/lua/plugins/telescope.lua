return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/" },
        },
        pickers = {
          find_files = {
            hidden = true,
            theme = "ivy",
            find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>bb", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader><leader>", builtin.live_grep, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
