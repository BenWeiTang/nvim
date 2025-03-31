return {
    -- Mason
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end
    },

    -- Mason LSP Config
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "cmake" }
            })
        end
    },

    -- Nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local config = require("lspconfig")

            config.cmake.setup({
                capabilities = capabilities,
            })
        end
    }
}
