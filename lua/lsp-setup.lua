-- DO NOT add "rust" to the list as rustaceanvim handles that automatically
-- DO NOT add "vue" to the list as typescript-language-server will automatically
-- use it as a plugin.
vim.lsp.enable({ "clangd", "luals", "ts", "html", "basedpyright", "tailwindcss" })

-- One command applicable for multiple LSPs (?)
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/#builtin-auto-completion
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--         end
--     end,
-- })

-- Auto complete
vim.cmd("set completeopt+=noselect")
