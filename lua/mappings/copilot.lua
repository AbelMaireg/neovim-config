local map = vim.keymap.set

map ("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    desc = "Accept the current completion item",
})

map ("i", "<C-R>", "<Plug>(copilot-dismiss)", {
    expr = false,
    replace_keycodes = false,
    desc = "Dismiss the current completion item",
})

map ("i", "<C-K>", "<Plug>(copilot-previous)", {
    expr = false,
    replace_keycodes = false,
    desc = "Go to the previous completion item",
})

map ("i", "<C-J>", "<Plug>(copilot-next)", {
    expr = false,
    replace_keycodes = false,
    desc = "Go to the next completion item",
})

map ("i", "<C-L>", "<Plug>(copilot-accept-word)", {
    expr = false,
    replace_keycodes = false,
    desc = "Accept the current completion item and move to the next word",
})

map ("i", "<C-O>", "<Plug>(copilot-accept-line)", {
    expr = false,
    replace_keycodes = false,
    desc = "Accept the current completion item and move to the next line",
})
