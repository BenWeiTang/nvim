return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "williamboman/mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb", },
                automatic_installation = false,
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            -- dap.listeners.after.event_initialized["dapui_config"] = function()
            --     dapui.open()
            -- end
            -- dap.listeners.before.event_terminated["dapui_config"] = function()
            --     dapui.close()
            -- end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            --     dapui.close()
            -- end

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    -- Needs Mac support...
                    -- command only takes absolute path
                    command = vim.fn.stdpath("data") .. "\\mason\\bin\\codelldb.cmd",
                    args = { "--port", "${port}" },

                    -- On windows you may have to uncomment this:
                    detached = false,
                }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
        end
    },
}
