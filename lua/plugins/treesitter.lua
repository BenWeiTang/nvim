return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "lua", "cpp", "c", "python", "c_sharp", "vim", "vimdoc", "vue", "javascript" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
