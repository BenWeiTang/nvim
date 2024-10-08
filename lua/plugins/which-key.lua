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
            { "<leader>d", group = "DAP" },
            { "<leader>f", group = "Find/Format" },
            { "<leader>g", group = "Git" },
            { "<leader>gh", group = "Hunk" },
            { "<leader>gb", group = "Buffer" },
            { "<leader>r", group = "Rename" },
            { "<leader>t", group = "Terminal" },
            { "<leader>w", group = "Window" },
        })
        -- wk.setup({
            -- key_labels = {
            --     ["<space>"] = "SPC",
            --     ["<cr>"] = "RET",
            --     ["<tab>"] = "TAB",
            --
            --     -- For some reason the label resorts to use the Mac version.
            --     -- Right now it's only obvious for the Thumb key,
            --     --  because the pinky key is identical on Mac and Windows
            --     -- I suspect there be some issues when generating these labels,
            --     --  that led to os_name in os-config.lua not cached correctly
            --     --
            --     -- For later references: the pinky key may cause problems as well
            --     ["<M-j>"] = require("os-config").ThumbCombo("j"),
            --     ["<M-k>"] = require("os-config").ThumbCombo("k"),
            --     ["<M-h>"] = require("os-config").ThumbCombo("h"),
            --     ["<M-l>"] = require("os-config").ThumbCombo("l"),
            --     ["<M-p>"] = require("os-config").ThumbCombo("p"),
            --     ["<M-n>"] = require("os-config").ThumbCombo("n"),
            --     ["<M-->"] = require("os-config").GetThumbKeyName() .. " -",
            --     ["<M-=>"] = require("os-config").GetThumbKeyName() .. " =",
            --     ["<M->>"] = require("os-config").GetThumbKeyName() .. " >",
            --     ["<M-lt>"] = require("os-config").GetThumbKeyName() .. " <",
            --     ["<M-/>"] = require("os-config").ThumbCombo("/"),
            -- }
        -- })
    end
}
