local map = vim.keymap.set
local dap = require ("dap")
local dapui = require ("dapui")

map ("n", "<F5>", function ()
    dap.continue ()
    dapui.open ()
end, { desc = "debugger continue" })

map ("n", "<F6>", function ()
    dap.step_over ()
end, { desc = "debugger step-over" })

map ("n", "<F7>", function ()
    dap.step_into ()
end, { desc = "debugger step-into" })

map ("n", "<F8>", function ()
    dap.step_out ()
end, { desc = "debugger step-out" })

map ("n", "<Leader>dq", function ()
    dap.terminate ()
    dapui.close ()
end, { desc = "debugger terminate" })

map ("n", "<Leader>b", function ()
    dap.toggle_breakpoint ()
end, { desc = "debugger toggle-breakpoint" })

map ("n", "<Leader>B", function ()
    dap.set_breakpoint ()
end, { desc = "debugger set-breakpoint" })

map ("n", "<Leader>lp", function ()
    dap.set_breakpoint (nil, nil, vim.fn.input ("Log point message: "))
end, { desc = "debugger set-breakpoint" })

map ("n", "<Leader>dr", function ()
    dap.repl.open ()
end, { desc = "debugger repl open" })

map ("n", "<Leader>dl", function ()
    dap.run_last ()
end, { desc = "debugger run last" })
