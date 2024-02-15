return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        if not dap.adapters["codelldb"] then
            dap.adapters["codelldb"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = {
                        "--port",
                        "${port}",
                    },
                },
            }
        end
        for _, lang in ipairs({ "c", "cpp" }) do
            dap.configurations[lang] = {
                {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch file",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "codelldb",
                    request = "attach",
                    name = "Attach to process",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
            }
        end

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
    end
}
