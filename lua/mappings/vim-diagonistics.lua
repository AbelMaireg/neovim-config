local map = vim.keymap.set

map ("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })

map (
    "n",
    "<leader>gq",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostics list" }
)
