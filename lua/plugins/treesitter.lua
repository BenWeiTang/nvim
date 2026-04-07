return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        config = function()
            local config = require("nvim-treesitter")
            config.setup({
                ensure_installed = { "lua", "cpp", "c", "python", "c_sharp", "vim", "vimdoc", "vue", "javascript", "typescript" },
                highlight = { enable = true },
                indent = { enable = true },
            })

            -- This forces Treesitter to start the parser for the current buffer, if it's a vue file.
            --
            -- Native treesitter has gotten better at identifying the various languages in a vue file.
            -- Also, newer versions of commentstring has also gotten better at using treesitter
            -- parsers to find the current comment style.
            -- The only issue is that treesitter is not automatically started when a buffer is
            -- loaded. Therefore, for a vue file, upon loading it into a buffer, we force start
            -- treesitter to start parsing and the commenting should come naturally.
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "vue",
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    }
}
