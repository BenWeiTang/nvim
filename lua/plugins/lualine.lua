return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = 'gruvbox_dark'
            },
            sections = {
                lualine_c = {
                    {
                        'buffers',
                        icons_enabled = false,
                        symbols = {
                            alternate_file = '',
                        },
                        buffers_color = {
                            active = { bg = '#504945', fg = '#ebdbb2' }, -- Hard-coded values that may not work for other themes
                            inactive = 'lualine_c_inactive'
                        }
                    },
                }
            },
        })
    end
}
