return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.lsp.config('*', { capabilities = { general = { positionEncodings = { "utf-16" } } } })

      if vim.env.WORKSPACE == "akeptous" then
        vim.lsp.enable("ruby_lsp")
        vim.lsp.enable("elmls")
      end

      vim.lsp.enable("ts_ls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("emmet_ls")

      -- Keymaps LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>zr", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>zf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>zz", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>zd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>za", vim.lsp.buf.code_action, {})
    end
  }
}
