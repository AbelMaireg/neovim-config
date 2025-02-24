local map = vim.keymap.set

-- A accept
map ("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    desc = "Accept the current completion item",
})

-- D dismiss
map ("i", "<C-D>", "<Plug>(copilot-dismiss)", {
    expr = false,
    replace_keycodes = false,
    desc = "Dismiss the current completion item",
})

-- P goto previous
map ("i", "<C-P>", "<Plug>(copilot-previous)", {
    expr = false,
    replace_keycodes = false,
    desc = "Go to the previous completion item",
})

-- N goto next
map ("i", "<C-N>", "<Plug>(copilot-next)", {
    expr = false,
    replace_keycodes = false,
    desc = "Go to the next completion item",
})

-- W accept word
map ("i", "<C-W>", "<Plug>(copilot-accept-word)", {
    expr = false,
    replace_keycodes = false,
    desc = "Accept the current completion item and move to the next word",
})

-- L accept line
map ("i", "<C-L>", "<Plug>(copilot-accept-line)", {
    expr = false,
    replace_keycodes = false,
    desc = "Accept the current completion item and move to the next line",
})
