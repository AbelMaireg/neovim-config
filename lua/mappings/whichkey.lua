local map = vim.keymap.set

map ("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map ("n", "<leader>wk", function ()
    vim.cmd ("WhichKey " .. vim.fn.input ("WhichKey: "))
end, { desc = "whichkey query lookup" })

map ("n", "<leader>yp", function ()
    local location = string.format (
        "%s:%d:%d",
        vim.fn.expand ("%"),
        vim.fn.line ("."),
        vim.fn.col (".")
    )

    vim.fn.setreg ("+", location)
end, { desc = "Copy relative file:line:col to system clipboard" })
