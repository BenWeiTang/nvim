return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = 'iceberg_dark'
            },
            sections = {
                lualine_c = {
                    {
                        'buffers',
                        icons_enabled = false,
                        symbols = {
                            alternate_file = '',
                        },
                        -- buffers_color = {
                            -- inactive = 'lualine_c_inactive'
                        -- }
                    },
                }
            },
        })
    end
}
