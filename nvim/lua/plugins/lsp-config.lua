return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, {
        general = {
          positionEncodings = { "utf-16" },
        },
      })

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("hls", {
        settings = {
          haskell = {
            formattingProvider = "fourmolu",
          },
        },
      })

      if vim.env.WORKSPACE == "akeptous" then
        vim.lsp.enable("hls")
        vim.lsp.enable("elmls")
        vim.lsp.enable("ruby_lsp")
        -- vim.lsp.enable("terraformls")
      end

      -- vim.lsp.enable("ansiblels")
      -- vim.lsp.enable("cssls")

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("emmet_ls")

      -- Keymaps LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gg", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})

      vim.diagnostic.config({ virtual_text = true })
    end
  }
}
