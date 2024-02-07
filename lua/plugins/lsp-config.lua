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

            config.lua_ls.setup({
                capabilities = capabilities
            })

            config.clangd.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false

                    local on_attach = require("cmp_nvim_lsp").on_attach
                    on_attach(client, bufnr)
                end,
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
                root_dir = config.util.root_pattern(
                    '.clangd',
                    '.clang-tidy',
                    '.clang-format',
                    'compile_commands.json',
                    'compile_flags.txt',
                    'configure.ac',
                    '.git'
                ) 
            })

            config.cmake.setup({
                capabilities = capabilities,
            })
        end
    }
}
