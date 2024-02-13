return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local os = require("os-config").GetName();

        dashboard.section.header.val = (os == "win") and {
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡶⠟⠛⠉⠙⠻⢿⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⣀⣤⣶⠿⠯⠤⠄⠀⠀⠀⠀⠀⠙⢿⣄⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣛⣻⢯⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠞⠋⠉⠀⠉⠛⠿⡦⡀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⠭⣍⣉⠛⢾⣝⡂⠀⠀⠀⠀⣠⡴⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡆⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⠀⣰⣿⣿⣿⣿⡙⢂⣠⠴⠿⠥⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡄⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣏⠳⢿⣿⣿⣿⢛⡇⠋⠡⢒⣒⣒⣒⣛⡛⠦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠘⡷⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⣿⠁⠘⠈⠀⠀⣈⡙⠳⠞⣠⡴⠊⠉⢉⣽⣦⣌⠉⠓⠦⣍⠳⡄⠀⠀⠀⠀⠀⠀⢹⠃",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⡇⠀⠀⠀⠀⡤⠞⠛⠓⠀⢧⣙⠲⢤⣾⣿⣽⣿⣿⡷⢤⡈⢧⠹⡄⠀⠀⠀⠀⠀⠀⡇",
                "⠀⠀⠀⠀⠀⣀⣴⠾⠻⢶⣄⠀⠀⠀⠀⢰⣿⣇⠹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠓⢦⣌⠙⠛⠛⠛⠓⠒⠛⠒⠷⠇⠀⠀⠀⠀⠀⠀⣿",
                "⠀⡶⠶⠒⠛⣫⣥⡴⠒⠂⢻⣧⠀⠀⠀⣸⣇⠈⢷⡈⠓⠦⣄⡀⠀⠀⠀⠀⠀⠈⣧⠀⠈⠉⠓⠒⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⣿⡇⠀⠀⠀⠀⢀⣇⠠⠤⣾⠻⠿⠶⠶⣿⠛⢦⡀⠉⠳⣄⡀⠉⠙⠲⠤⣄⣀⡀⠈⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇",
                "⡿⠛⠶⠶⠒⠚⠛⠙⢦⣼⠃⠀⠀⠀⠀⢿⠀⠈⠙⠦⣄⠀⠙⠓⢦⣄⣀⠀⠈⠉⠓⠲⠦⠤⠤⣤⣀⣠⣄⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⠇",
                "⣿⣄⢀⣀⣠⡤⠤⠤⢾⡏⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠈⠙⠲⠦⣤⣀⣈⠉⠛⠒⠶⠦⠤⠤⠤⣤⠄⠉⣻⠆⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀",
                "⣽⡿⠉⠁⠀⠀⠀⢀⣼⠁⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠓⠒⠒⠒⠒⠒⠒⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀",
                "⠙⣷⣀⣀⣤⠴⠒⠋⢹⣧⣄⣀⣀⣀⣀⣀⣹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡏⠀",
                "⠀⠸⣿⡁⠀⠀⣀⣴⠟⠉⠉⠉⠉⠉⠉⠛⢻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀",
                "⠀⠀⠙⠛⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠏⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡏⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠁⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣸⣧⡀⣀⣀⣀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠒⠉⠉⠉⠁⠀⠀⠉⠉⠉⠉⠉",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            }
            or {
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⢀⣠⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣄⣀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⣠⠄⣡⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠱⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⡜⢡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⠣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⡘⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⣿⠛⠛⡿⠛⡿⠛⢿⠿⡿⢿⣿⣿⣶⡈⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡛⢻⣀⣨⣧⣤⣼⣤⣴⡇⠰⢇⣀⣟⣀⣇⣸⣀⡏⢻⣿⡀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⡿⣏⠹⣆⡿⠾⠟⠚⠉⠉⠀⠀⠈⠉⠐⠐⠒⠒⠛⠋⠉⠛⢷⣼⣸⣇⠀⠀⠀⡀⡀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣟⠳⣤⣸⡷⠋⠀⡤⠔⠒⠚⠛⠛⠓⠀⠀⠀⠀⠀⠔⠒⠒⠲⢄⡀⠙⣿⣿⠀⠀⠀⢇⠁⠀⠀",
                "⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡳⣬⣷⠟⠁⠀⠀⠀⠀⠄⠒⠒⠀⠀⠈⠷⠀⠀⠀⠀⢸⠀⠀⠤⣄⣀⠀⢿⡇⠀⠀⣰⢾⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⣿⣿⠷⣌⠛⡿⠃⣀⠀⠀⠀⣶⠄⣴⡲⣶⣶⣶⣄⠀⠀⠀⠀⠀⠀⣠⣤⣀⣀⡈⠁⣾⠄⠀⠀⡾⡜⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⢻⡻⣦⡉⡿⠃⠀⢸⣷⠆⠀⠀⠀⣘⣻⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⣟⣾⣿⣿⠘⠯⣿⡀⠀⠀⣻⣧⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠰⠈⢷⡈⢻⡇⠀⠀⢸⣿⣿⠆⠀⠀⠈⠉⠙⠟⠛⠁⠀⠀⠀⠀⠸⡇⠈⠹⠟⠓⠂⠀⢼⡇⠀⠀⢇⣆⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠱⠈⠻⣾⡇⠀⠀⢸⣿⣗⡿⣶⡄⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠠⠄⣜⣐⣿⡧⠀⣠⡿⠈⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⠀⠀⠈⢿⣟⣿⣿⣿⣧⠌⠀⠀⠀⢾⠛⠀⠀⠀⠀⠀⣰⠃⠀⡔⢮⣟⣿⠡⣺⣁⠅⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⢸⣟⣾⣿⣿⣿⣇⡆⣠⠟⣈⣟⣧⠍⣁⡜⡓⠃⡆⢠⣾⣿⡿⠁⢐⣷⠋⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⢘⣾⡾⣿⣾⣽⣿⣛⠴⠋⢜⣟⣋⡑⠙⠋⠛⠿⡶⣵⢸⣿⡿⠁⠀⠈⢸⣆⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⢀⣀⣀⣤⣴⡏⠀⠀⠐⢺⡧⢭⢽⣿⣾⣿⣷⣄⡬⡀⠉⡹⠿⠿⠿⠿⠯⣿⢿⣿⠃⠀⠀⡠⣳⡟⠀⠀⠀⠀⠀",
                "⢀⠊⣠⣴⣾⣿⣿⣿⣿⣿⠁⠀⠀⠀⢨⣠⢟⢮⣿⣫⢿⣿⣿⣿⣿⣿⣿⣶⣾⣶⣶⣴⣿⡿⠿⣢⡄⠛⠊⠁⠀⠀⠀⠀⠀⠀",
                "⠀⢴⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⢀⣨⠝⡃⡟⠾⡪⣑⢻⢿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣷⣄⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⢸⣿⣿⣿⣿⣿⣿⣯⣤⣤⣄⣰⠋⠀⠀⠀⠈⠁⠛⠾⡛⠧⡖⣿⣛⣻⠜⣿⣿⣿⣿⣿⣿⣿⣷⣤⡈⠂⠀⠀⠀⠀⠀⠀⠀",
                "⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠃⠋⠆⠓⠉⠃⠊⣡⣭⣿⣿⣿⣿⣿⣿⣿⣿⣤⣤⣤⣄⣀⠀⠀⠀",
                "⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⢶⣾⡷⠦⣤⡤⣶⣶⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦",
                "⠀⠘⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠒⠛⠛⠛⠛⠛⠓⠚⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛",
            }

        dashboard.section.buttons.val = {
            dashboard.button("f", string.format("%s  > Find file", (os == "win") and " " or ""),
                ":Telescope find_files<CR>"),
            dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
            dashboard.button("m", "  > Mason", ":Mason<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        dashboard.section.footer.val = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        end
        dashboard.section.footer.opts.hl = "Type"

        alpha.setup(dashboard.config)
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
