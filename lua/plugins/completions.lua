return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" }, -- this plugin/source knows to enable itself only inside lua
                    { name = "luasnip" },
                    { name = "buffer" , keyword_length = 5},
                    { name = "path" },
                    { name = "nvim_lsp" }
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            buffer = "[buf]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[API]",
                            path = "[path]",
                            luasnip = "[Snippet]",
                        })[entry.source.name]

                        vim_item.dup = ({
                            buffer = 0,
                            nvim_lsp = 0,
                            nvim_lua = 0,
                            path = 0,
                            luansip = 0,
                        })[entry.source.name] or 0

                        return vim_item
                    end
                },

                -- See: https://github.com/p00f/clangd_extensions.nvim/blob/main/README.md#completion-scores
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.recently_used,
                        require("clangd_extensions.cmp_scores"),
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
            })

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })
        end
    },
}
