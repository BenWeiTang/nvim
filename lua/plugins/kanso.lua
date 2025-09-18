return {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanso").setup({
            background = {
                dark = "zen",
                light = "zen",
            },
        })
        vim.cmd("colorscheme kanso")
    end,
}
