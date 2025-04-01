return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'enter', -- 'default' uses <C-y> to accept
            ["<A-j>"] = { "select_next", "fallback" },
            ["<A-k>"] = { "select_prev", "fallback" },
        },

        appearance = {
            -- use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = "rounded", -- TODO: unify this with `vim.o.winborder`
                    scrollbar = false,
                    winhighlight = "Normal:BlinkCmpDoc"
                },
            },
            menu = {
                border = "rounded", -- TODO: unify this with `vim.o.winborder`
                scrollbar = false,
                winhighlight = "PMenu:BlinkCmpMenu",
            },
            -- Not sure if I want this...
            -- ghost_text = { enabled = true },
        },

        signature = { enabled = true },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        cmdline = {
            keymap = {
                preset = "cmdline",
                ["<A-j>"] = { "select_next", "fallback" },
                ["<A-k>"] = { "select_prev", "fallback" },
            },
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                menu = { auto_show = true },
                ghost_text = { enabled = true },
            },
        },
    },
    opts_extend = { "sources.default" }
}
