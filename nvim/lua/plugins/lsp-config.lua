return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ruby_lsp.setup({
                capabilities = capabilities
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>cc", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {})
        end,
    },
}
