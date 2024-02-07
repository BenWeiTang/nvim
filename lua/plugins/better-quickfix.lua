return {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
        require("bqf").setup({
            auto_enable = true,
            auto_resize_height = true,
            preview = {
                show_title = false,
            }
        })
    end
}
