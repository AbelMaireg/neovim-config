local map = vim.keymap.set

map ("n", "gl", function ()
    vim.diagnostic.open_float ({
        border = "single",
    })
end, { desc = "Show diagnostic popup" })

map (
    "n",
    "<leader>gq",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostics list" }
)
