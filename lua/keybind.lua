-- Platform-agnostic action keys
local os = require("os-config")
local ThumbCombo = os.ThumbCombo
local PinkyCombo = os.PinkyCombo

-- Basic Vim Key Remap
vim.keymap.set("i", "kj", "<esc>", { desc = "Return to Normal Mode", remap = false })
vim.keymap.set("v", "q", "<esc>", { desc = "Return to Normal Mode", remap = false })
vim.keymap.set("n", "<space>", ":w<CR>", { desc = "Save", remap = false })
vim.keymap.set("c", "qq<CR>", ":wqa<CR>", { desc = "Write-quit all" , remap = false })
vim.keymap.set("n", PinkyCombo("d"), "<c-d>zz", { desc = "Go down half a page", remap = false})
vim.keymap.set("n", PinkyCombo("u"), "<c-u>zz", { desc = "Go up half a page", remap = false})

vim.keymap.set("n", ThumbCombo("h"), "<C-w>h", { desc = "Go to left window", remap = false })
vim.keymap.set("n", ThumbCombo("j"), "<C-w>j", { desc = "Go to lower window", remap = false })
vim.keymap.set("n", ThumbCombo("k"), "<C-w>k", { desc = "Go to upper window", remap = false })
vim.keymap.set("n", ThumbCombo("l"), "<C-w>l", { desc = "Go to right window", remap = false })

vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = false })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = false })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = false })
vim.keymap.set("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = false })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = false })
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = false })

vim.keymap.set("n", "H", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })

vim.keymap.set("n", ThumbCombo("="), "<C-w>+", { desc = " window height"})
vim.keymap.set("n", ThumbCombo("-"), "<C-w>-", { desc = " window height"})
vim.keymap.set("n", ThumbCombo(">"), "<C-w>>", { desc = " window width"})
vim.keymap.set("n", ThumbCombo("<"), "<C-w><", { desc = " window width"})

vim.keymap.set("n", "yc", "yygccp", { desc = "Duplicate a line and comment out the first line", remap = true })
vim.keymap.set({"n", "v"}, ",y", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set({"n", "v"}, ",p", "\"+p", { desc = "Paste from system clipboard" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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

-- Blink-cmp
-- The keymap setup for blink is a little weird. They are configured in its own plugin file for this reason.

-- luasnip
local ls = require("luasnip")
vim.keymap.set({"i", "s"}, ThumbCombo("l"), function ()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })
vim.keymap.set({"i", "s"}, ThumbCombo("h"), function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
vim.keymap.set({"i"}, ThumbCombo(";"), function ()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
vim.keymap.set({"i"}, ThumbCombo(","), function ()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end, { silent = true })

-- Debugging
-- local dap = require("dap")
-- vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" }) -- "dt" means debug toggle
-- vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })          -- "dc" means debug continue

-- Floating Terminal
vim.keymap.set("n", "<leader>tt", "<CMD>lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>tt", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>td", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>", { desc = "Delete floating terminal session" }) -- Maybe I want to exit terminal upon closing as well...

-- Gitsigns
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gbs", ":Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gbr", ":Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
-- vim.keymap.set("n", "<leader>ghd", ":Gitsigns diffthis<CR>", { desc = "Diff this" })
-- vim.keymap.set("n", "<leader>ghD", ":Gitsigns diffthis ~<CR>", { desc = "Diff this" })

-- Nvim-lspconfig
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Neotree
vim.keymap.set("n", ThumbCombo("n"), ":Neotree filesystem toggle left<cr>", { desc = "Toggle filesystem" })

-- None-ls
vim.keymap.set("n", "<leader>fg", vim.lsp.buf.format, { desc = "Format File" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", ThumbCombo("p"), builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Fuzzy Find" })
vim.keymap.set("n", "<leader>fw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = "Fuzzy Find Word Under Cursor" })

-- Flash
local flash = require("flash")
vim.keymap.set({ "n", "x", "o" },   "s",    function() flash.jump() end,                {desc = "Flash"})
vim.keymap.set({ "n", "x", "o" },   "S",    function() flash.treesitter() end,          {desc = "Flash Treesitter"})
vim.keymap.set({ "o" },             "r",    function() flash.remote() end,              {desc = "Remote Flash"})
vim.keymap.set({ "o", "x" },        "R",    function() flash.treesitter_search() end,   {desc = "Treesitter Search"})
vim.keymap.set({ "c" },  ThumbCombo("s"),   function() flash.toggle() end,              {desc = "toggle Flash Search"})

-- Mini Move
local mini_move = require("mini.move")
mini_move.setup({
    mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = 'H',
        right = 'L',
        down = 'J',
        up = 'K',

        -- Move current line in Normal mode (disable all)
        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
    },
    options = { reindent_linewise = true }
})

-- Header / source file switching
local is_unreal_project = require("project-env-config").GetIsUnrealProject()
if not is_unreal_project then
    -- clangd extensions
    vim.keymap.set("n", ThumbCombo("o"), "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header" })
else
    -- ATM clangd does not work properly with UE's setup because of the auto generated header file and its directory structure
    vim.keymap.set("n", ThumbCombo("o"), function()
        local path = require("path")
        local cur_name = path.GetCurrentFileName()
        local pair = vim.split(cur_name, ".", { plain=true })   -- Split into pair (i.g., name.type)
        local file_name = pair[1]
        local file_type = pair[2]

        if file_type ~= "cpp" and file_type ~= "h" then
            local cur_abs = path.GetCurrentAbsPath()
            local msg = string.format("Not a source file nor a header file. Path: %s", cur_abs)
            print(msg)
            return
        end
        local target_type = file_type == "cpp" and "h" or "cpp"      -- Flip h and cpp

        local target_file_name = vim.fs.find(function(entry, _)
            local target = string.format("%s.%s", file_name, target_type)
            return entry:match(string.format("%s$", target))
        end, {
            type = "file",
        })

        target_file_name = target_file_name[1]  -- target_file_name was a list of strings, now it becomes its first element: string
        if (target_file_name == nil) then
            if target_type == "cpp" then
                print("Couldn't find the corresponding source file. Is it header-only?")
            elseif target_type == "h" then
                print("Couldn't find the corresponding header file!")
            end
            return
        end
        vim.cmd(string.format("e %s", target_file_name))
    end, { desc = "Switch Source/Header" })
end
