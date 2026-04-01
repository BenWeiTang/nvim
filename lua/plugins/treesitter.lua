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
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    }
}
