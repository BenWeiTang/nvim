return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format.with({
                    -- See below links for more info
                    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md#arguments
                    -- https://clang.llvm.org/docs/ClangFormatStyleOptions.html
                    extra_args = { '-style=Google' },
                }),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            }
        })
    end
}
