local map = vim.keymap.set
local dapui = require ("dapui")
local dap_ui_widgets = require ("dap.ui.widgets")

map ("n", "<Leader>dt", function ()
    dapui.toggle ()
end, { desc = "debugger ui toggle" })

map ("n", "<Leader>do", function ()
    dapui.open ()
end, { desc = "debugger ui open" })

map ("n", "<Leader>dc", function ()
    dapui.close ()
end, { desc = "debugger ui close" })

map ({ "n", "v" }, "<Leader>Dh", function ()
    dap_ui_widgets.hover ()
end, { desc = "debugger ui widgets hover" })

map ({ "n", "v" }, "<Leader>Dp", function ()
    dap_ui_widgets.preview ()
end, { desc = "debugger ui widgets preview" })

map ("n", "<Leader>Df", function ()
    dap_ui_widgets.centered_float (dap_ui_widgets.frames)
end, { desc = "dubugger ui widgets centered-float framed" })

map ("n", "<Leader>Ds", function ()
    dap_ui_widgets.centered_float (dap_ui_widgets.scopes)
end, { desc = "debugger ui widgets centered_float scoped" })
