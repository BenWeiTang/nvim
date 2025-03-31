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

            local clangd_path = "clangd"
            local proj_env = require("project-env-config")
            if proj_env.GetIsUnrealProject() then
                -- This will require installing a clangd thorugh Visual Studio Installer
                clangd_path = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\Llvm\\x64\\bin\\clangd.exe"
            end

            config.clangd.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false

                    local on_attach = require("cmp_nvim_lsp").on_attach
                    if on_attach ~= nil then
                        on_attach(client, bufnr)
                    end
                end,

                -- See: https://github.com/p00f/clangd_extensions.nvim/blob/main/README.md#completion-scores
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
                cmd = {
                    clangd_path,
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
