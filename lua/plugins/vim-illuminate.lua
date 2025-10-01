return {
    "RRethy/vim-illuminate",

    -- This is a hack to make sure `nvim_set_hl` is run
    -- AFTER the "Visual" highlight group is initialized
    event = "VeryLazy",

    config = function()
        require("illuminate").configure({
            delay = 100,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = {
                    "lsp",
                    "treesitter",
                    "regex",
                },
            }
        })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end
}
