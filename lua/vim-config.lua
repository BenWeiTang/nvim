-- Editor Appearance Setup
vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set ignorecase')

-- Leader (Needs to be set before loading plugins)
vim.g.mapleader = ','

-- I added these lines here from (https://github.com/LunarVim/LunarVim/discussions/4418)
-- And the reason was to erase the weird background color in the snippet
-- Not too sure if this works well on other themes and on other platforms
vim.cmd("autocmd ColorScheme * highlight NormalFloat guifg=none guibg=none")
vim.cmd("autocmd ColorScheme * highlight FloatBorder guifg=none guibg=none")
vim.cmd("autocmd ColorScheme * highlight FloatTitle guifg=none guibg=none")

vim.lsp.set_log_level("off") -- set to "debug" when you need to debug

-- Sets the border for hovering (Uppercase K)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)
