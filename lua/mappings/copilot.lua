local map = vim.keymap.set

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
    "lua",
    "javascript",
    "typescript",
    "rust",
    "c",
    "cpp",
    "java",
    "html",
    "css",
    "sass",
    "scss",
    "markdown",
}

map("i", "<M-a>", 'copilot#Accept("\\<CR>")')

map("i", "<M-r>", "<Plug>(copilot-dismiss)")

map("i", "<M-k>", "<Plug>(copilot-previous)")
map("i", "<M-j>", "<Plug>(copilot-next)")

map("i", "<M-l>", "<Plug>(copilot-accept-word)")

map("i", "<M-o>", "<Plug>(copilot-accept-line)")
