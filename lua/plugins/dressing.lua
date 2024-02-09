return {
    'stevearc/dressing.nvim',
    config = function()
        require("dressing").setup({
            select = {
                backend = { "builtin", "telescope", "nui", "fzf", "fzf_lua" }
            },
        })
    end
}
