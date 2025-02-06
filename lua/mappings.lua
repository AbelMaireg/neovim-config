require("nvchad.mappings")

local nomap = vim.keymap.del

nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<Leader>h")
nomap("n", "<Leader>v")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- pane
map("n", "<A-Up>", ":resize +1<CR>", { desc = "Increase height" })
map("n", "<A-Down>", ":resize -1<CR>", { desc = "Decrease height" })
map("n", "<A-Left>", ":vertical resize -1<CR>", { desc = "Decrease width" })
map("n", "<A-Right>", ":vertical resize +1<CR>", { desc = "Increase width" })
map("n", "<A>=", ":wincmd =<CR>", { desc = "Equalize panes size" })

-- buffer
local tabufline = require("nvchad.tabufline")
map("n", "<Leader>tn", function()
    tabufline.move_buf(1)
end, { desc = "move tab to the right" })
map("n", "<Leader>tp", function()
    tabufline.move_buf(-1)
end, { desc = "move tab to the left" })
map("n", "<Leader>tx", function()
    tabufline.closeAllBufs(false)
end, { desc = "close all other tabs" })
map("n", "<Leader>tX", function()
    tabufline.closeAllBufs(true)
end, { desc = "close all tabs" })
map("n", "<Leader>tl", function()
    tabufline.closeBufs_at_direction("left")
end, { desc = "close all tabs to the left" })
map("n", "<Leader>tr", function()
    tabufline.closeBufs_at_direction("right")
end, { desc = "close all tabs to the right" })

-- motion
map("i", "jk", "<ESC>")
map("n", "<A-k>", ":m .-2<CR>==", { desc = "move line up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move selected line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move selected line down" })

-- terminal
for _, mapping in ipairs({
    { "<A-h>", "horizontal" },
    { "<A-v>", "vertical" },
    { "<A-i>", "float" },
}) do
    map({ "n", "t" }, mapping[1], function()
        require("nvterm.terminal").toggle(mapping[2])
    end, { desc = "terminal" .. mapping[2] })
end

map("n", "<Leader>rt", function()
    require("nvterm.terminal").send("yarn test", "vertical")
end, { desc = "run test" })

-- nvim-dap
local dap = require("dap")
local dap_ui_widgets = require("dap.ui.widgets")

map("n", "<F5>", function()
    dap.continue()
end, { desc = "debugger continue" })
map("n", "<F10>", function()
    dap.step_over()
end, { desc = "debugger step-over" })
map("n", "<F11>", function()
    dap.step_into()
end, { desc = "debugger step-into" })
map("n", "<F12>", function()
    dap.step_out()
end, { desc = "debugger step-out" })
map("n", "<Leader>b", function()
    dap.toggle_breakpoint()
end, { desc = "debugger toggle-breakpoint" })
map("n", "<Leader>B", function()
    dap.set_breakpoint()
end, { desc = "debugger set-breakpoint" })
map("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "debugger set-breakpoint" })
map("n", "<Leader>dr", function()
    dap.repl.open()
end, { desc = "debugger repl open" })
map("n", "<Leader>dl", function()
    dap.run_last()
end, { desc = "debugger run last" })
map({ "n", "v" }, "<Leader>dh", function()
    dap_ui_widgets.hover()
end, { desc = "debugger ui widgets hover" })
map({ "n", "v" }, "<Leader>dp", function()
    dap_ui_widgets.preview()
end, { desc = "debugger ui widgets preview" })
map("n", "<Leader>df", function()
    dap_ui_widgets.centered_float(dap_ui_widgets.frames)
end, { desc = "dubugger ui widgets centered-float framed" })
map("n", "<Leader>ds", function()
    dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
end, { desc = "debugger ui widgets centered_float scoped" })

-- telescope
local telescope_builtin = require("telescope.builtin")

map("n", "<Leader>gb", function()
    telescope_builtin.git_branches()
end, { desc = "git branches" })
map("n", "<Leader>gc", function()
    telescope_builtin.git_commits()
end, { desc = "git commits" })
map("n", "<Leader>gf", function()
    telescope_builtin.git_files()
end, { desc = "git files" })
map("n", "<Leader>gs", function()
    telescope_builtin.git_stash()
end, { desc = "git stash" })
map("n", "gL", function()
    telescope_builtin.diagnostics()
end, { desc = "List diagnostics" })

-- rustaceanvim
map(
    "n",
    "<Leader>dt",
    "<cmd>lua vim.cmd('RustLsp testables')<CR>",
    { desc = "Debugger testables" }
)

-- diagonistics
map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
map(
    "n",
    "<leader>gq",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostics list" }
)

map(
    "n",
    "gd",
    vim.lsp.buf.definition,
    { noremap = true, silent = true, desc = "go to definition" }
)
map(
    "n",
    "gD",
    vim.lsp.buf.declaration,
    { noremap = true, silent = true, desc = "go to declaration" }
)
map(
    "n",
    "<leader>sb",
    vim.lsp.buf.rename,
    { noremap = true, silent = true, desc = "rename word" }
)