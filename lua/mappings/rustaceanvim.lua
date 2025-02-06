local map = vim.keymap.set

map(
    "n",
    "<Leader>dt",
    "<cmd>lua vim.cmd('RustLsp testables')<CR>",
    { desc = "Debugger testables" }
)