return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            if vim.env.WORKSPACE == "akeptous" then
              -- Ruby
              lspconfig.ruby_lsp.setup({
                  capabilities = capabilities
              })

              -- Elm
              lspconfig.elmls.setup({
                  capabilities = capabilities
              })

              -- PugJS
              lspconfig.pugls.setup({
                  capabilities = capabilities
              })
            end

            -- JavaScript / TypeScript
            lspconfig.tsserver.setup({
                capabilities = capabilities
            })

            -- SCSS / CSS
            lspconfig.cssls.setup({
                capabilities = capabilities
            })

            -- Bash + Zsh
            lspconfig.bashls.setup({
                filetypes = { "sh", "zsh" },
                capabilities = capabilities
            })

            -- Yaml
            lspconfig.yamlls.setup({
                capabilities = capabilities
            })

            -- Keymaps LSP
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
            vim.keymap.set("n", "<leader>cc", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
