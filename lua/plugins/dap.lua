return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "rcarriga/nvim-dap-ui" },
        config = function ()
            local dap, dapui = require ("dap"), require ("dapui")

            dapui.setup ()

            dap.listeners.before.attach.dapui_config = function ()
                dapui.open ()
            end
            dap.listeners.before.launch.dapui_config = function ()
                dapui.open ()
            end
            dap.listeners.before.event_terminated.dapui_config = function ()
                dapui.close ()
            end
            dap.listeners.before.event_exited.dapui_config = function ()
                dapui.close ()
            end

            require ("configs.dap-conf")
            require ("mappings.dap")
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function ()
            require ("mappings.dap-ui")

            require ("dapui").setup ({
                layouts = {
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks", size = 0.20 },
                            { id = "watches", size = 0.20 },
                        },
                        size = 48,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "scopes", size = 0.35 },
                            { id = "console", size = 0.5 },
                        },
                        size = 16,
                        position = "bottom",
                    },
                },
            })
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
