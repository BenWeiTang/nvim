return {
    'numToStr/FTerm.nvim',
    config = function()
        require("FTerm").setup({
            -- cmd = (require("os-config").GetName() == "win") and "pwsh" or "zsh",
            cmd = require("os-config").GetShellName(),
        })
    end
}
