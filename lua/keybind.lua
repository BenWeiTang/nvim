-- Platform-agnostic action keys
local os = require("os-config")
local ThumbCombo = os.ThumbCombo
local PinkyCombo = os.PinkyCombo

-- Basic Vim Key Remap
vim.keymap.set("i", "kj", "<esc>", { desc = "Return to Normal Mode", remap = false })
vim.keymap.set("n", "<space>", ":w<cr>", { desc = "Save", remap = false })

vim.keymap.set("n", ThumbCombo("h"), "<C-w>h", { desc = "Go to left window", remap = true }) -- Honestly, not too sure if I want recursive mapping here...
vim.keymap.set("n", ThumbCombo("j"), "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", ThumbCombo("k"), "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", ThumbCombo("l"), "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

vim.keymap.set("n", "H", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })

vim.keymap.set("n", "<leader>/", ":noh<CR>", { desc = "Remove Highlight" })

vim.keymap.set("n", ThumbCombo("="), "<C-w>+", { desc = " window height"})
vim.keymap.set("n", ThumbCombo("-"), "<C-w>-", { desc = " window height"})
vim.keymap.set("n", ThumbCombo(">"), "<C-w>>", { desc = " window width"})
vim.keymap.set("n", ThumbCombo("<"), "<C-w><", { desc = " window width"})

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

        comment_line = ThumbCombo("/"),
        comment_visual = ThumbCombo("/"),
    }
})

-- cmp
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Default recommended mapping
        [PinkyCombo("b")] = cmp.mapping.scroll_docs(-4),
        [PinkyCombo("f")] = cmp.mapping.scroll_docs(4),
        [PinkyCombo("Space")] = cmp.mapping.complete(),
        [PinkyCombo("e")] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- Custom mapping
        [ThumbCombo("k")] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        [ThumbCombo("j")] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    }),
})

-- Debugging
local dap = require("dap")
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" }) -- "dt" means debug toggle
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })          -- "dc" means debug continue

-- Floating Terminal
vim.keymap.set("n", "<leader>tt", "<CMD>lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>tt", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>td", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>", { desc = "Delete floating terminal session" }) -- Maybe I want to exit terminal upon closing as well...

-- Gitsigns
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Previous hun" })
vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gbs", ":Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gbr", ":Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>ghd", ":Gitsigns diffthis<CR>", { desc = "Diff this" })
vim.keymap.set("n", "<leader>ghD", ":Gitsigns diffthis ~<CR>", { desc = "Diff this" })

-- Leap
vim.keymap.set({ "n", "v" }, "<leader>l", "<Plug>(leap-forward)", { desc = "Leap forward" })
vim.keymap.set({ "n", "v" }, "<leader>L", "<Plug>(leap-backward)", { desc = "Leap backward" })

-- Nvim-lspconfig
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
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
end, { desc = "Rename variable" })

-- Neotree
vim.keymap.set("n", ThumbCombo("n"), ":Neotree filesystem toggle left<cr>", { desc = "Toggle filesystem" })

-- None-ls
vim.keymap.set("n", "<leader>fg", vim.lsp.buf.format, { desc = "Format File" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", ThumbCombo("p"), builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Fuzzy Find" })
