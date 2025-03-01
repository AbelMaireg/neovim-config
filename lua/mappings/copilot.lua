local map = vim.keymap.set

-- A accept
map ("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    desc = "Accept the current completion item",
})

-- D dismiss
map ("i", "<M-D>", "<Plug>(copilot-dismiss)", {
    expr = false,
    replace_keycodes = false,
    desc = "Dismiss the current completion item",
})

-- P goto previous
map ("i", "<M-P>", "<Plug>(copilot-previous)", {
    expr = false,
    replace_keycodes = false,
    desc = "Go to the previous completion item",
})

-- N goto next
map ("i", "<M-N>", "<Plug>(copilot-next)", {
    expr = false,
    replace_keycodes = false,
    desc = "Go to the next completion item",
})

-- W accept word
map ("i", "<M-W>", "<Plug>(copilot-accept-word)", {
    expr = false,
    replace_keycodes = false,
    desc = "Accept the current completion item and move to the next word",
})

-- L accept line
map ("i", "<M-L>", "<Plug>(copilot-accept-line)", {
    expr = false,
    replace_keycodes = false,
    desc = "Accept the current completion item and move to the next line",
})
