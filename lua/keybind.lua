-- Basic Vim Key Remap
vim.keymap.set("i", "kj", "<esc>", { remap = false })
vim.keymap.set("n", "<space>", ":w<cr>", { remap = false })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true }) -- Honestly, not too sure if I want recursive mapping here...
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

vim.keymap.set("n", "H", ":bprevious<CR>")
vim.keymap.set("n", "L", ":bnext<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

vim.keymap.set("n", "<leader>/", ":noh<CR>") -- Leader / to remove highlight, useful after searching a pattern

-- Buffer Remove
vim.keymap.set("n", "<leader>bd", function()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
        vim.ui.select({ "Yes", "No", "Cancel" }, {
            prompt = string.format("Save changes to %s?", vim.fn.bufname():match("[^/\\]+$"))
        }, function(choice)
            if choice == "Yes" then -- Yes
                vim.cmd.write()
                bd(0)
            elseif choice == "No" then -- No
                bd(0, true)
            end
        end)
    else
        bd(0)
    end
end, { desc = "Delete buffer", remap = false })

-- clangd extensions
vim.keymap.set("n", "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header" })

-- Comment
local comment = require("mini.comment")
comment.setup({
    mappings = {
        -- Originally 'gc', but it's not really used so set to disabled
        comment = "",
        textobject = "",

        comment_line = "<A-/>",
        comment_visual = "<A-/>",
    }
})

-- cmp
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Default recommended mapping
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- Custom mapping
        ["<A-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<A-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    }),
})

-- Debugging
local dap = require("dap")
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {}) -- "dt" means debug toggle
vim.keymap.set("n", "<leader>dc", dap.continue, {})          -- "dc" means debug continue

-- Floating Terminal
vim.keymap.set("n", "<leader>tt", "<CMD>lua require('FTerm').toggle()<CR>")
vim.keymap.set("t", "<leader>tt", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
vim.keymap.set("t", "<leader>td", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>") -- Maybe I want to exit terminal upon closing as well...

-- Gitsigns
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Previous Hund" })
vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })

-- Leap
vim.keymap.set({ "n", "v" }, "<leader>s", "<Plug>(leap-forward)", {})
vim.keymap.set({ "n", "v" }, "<leader>S", "<Plug>(leap-backward)", {})
vim.keymap.set("n", "<leader>gs", "<Plug>(leap-from-window)", {})

-- Nvim-lspconfig
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rr", function()
    vim.ui.input("New name", function(input)
        if not input or input == "" then
            print("Rename aborted!")
            return
        end
        local position_params = vim.lsp.util.make_position_params()
        position_params.newName = input
        vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ctx, config)
            vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)

            if result and result.changes then
                local entries = {}
                for uri, edits in pairs(result.changes) do
                    local bufnr = vim.uri_to_bufnr(uri)

                    for _, edit in ipairs(edits) do
                        local start_line = edit.range.start.line + 1
                        local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

                        table.insert(entries, {
                            bufnr = bufnr,
                            lnum = start_line,
                            col = edit.range.start.character + 1,
                            text = line,
                        })
                    end
                end
                vim.cmd(":copen")
                vim.fn.setqflist(entries, "r")
            end
        end)
    end)
end, {})

-- Neotree
vim.keymap.set("n", "<a-n>", ":Neotree filesystem toggle left<cr>", {})

-- None-ls
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<a-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
