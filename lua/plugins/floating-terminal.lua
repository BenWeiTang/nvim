return {
    'numToStr/FTerm.nvim',
    config = function()
        require("FTerm").setup({
            cmd = "pwsh", -- Obviously want this to work on different platform as well
        })
    end
}
