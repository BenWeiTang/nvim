return {
    "norcalli/nvim-colorizer.lua",
    vim.cmd("set termguicolors"),
    config = function()
        require("colorizer").setup()
    end
}
