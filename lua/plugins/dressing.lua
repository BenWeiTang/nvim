return {
    'stevearc/dressing.nvim',
    config = function()
        require("dressing").setup({
            select = {
                backend = { "nui", "telescope", "builtin", "fzf", "fzf_lua" }
            },
        })
    end
}
