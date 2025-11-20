return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = 'tomorrow_night',
                -- theme = 'iceberg_dark',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
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
