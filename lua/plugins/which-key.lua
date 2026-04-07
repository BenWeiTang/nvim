return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>b", group = "Buffer" },
            { "<leader>c", group = "Code" },
            { "<leader>f", group = "Find/Format" },
            { "<leader>g", group = "Git" },
            { "<leader>gh", group = "Hunk" },
            { "<leader>gb", group = "Buffer" },
            { "<leader>t", group = "Terminal" },
            { "<leader>w", group = "Window" },
        })
    end
}
