return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = " 󰍉 ",
                    path_display = { "truncate", truncate = 2 },
                },
            })
        end
    },
}
