return {
    -- Mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
            },
        },
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
                capabilities = capabilities,

                -- Found the following setup from:
                -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT'
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                    }
                                }
                            }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end
            })

            config.clangd.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false

                    local on_attach = require("cmp_nvim_lsp").on_attach
                    on_attach(client, bufnr)
                end,

                -- See: https://github.com/p00f/clangd_extensions.nvim/blob/main/README.md#completion-scores
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
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
