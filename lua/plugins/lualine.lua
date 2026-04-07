return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            theme = 'iceberg_dark',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        },
        sections = {
            lualine_c = {
                {
                    'buffers',
                    icons_enabled = false,
                    symbols = { alternate_file = '' },
                }
            },
        }
    },
}
