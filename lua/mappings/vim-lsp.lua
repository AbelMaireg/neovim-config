local map = vim.keymap.set

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

map(
    "n",
    "gd",
    vim.lsp.buf.definition,
    { noremap = true, silent = true, desc = "go to definition" }
)

map(
    "n",
    "<leader><leader>",
    ":lua vim.lsp.buf.clear_references() vim.lsp.buf.document_highlight()<CR>",
    { noremap = true, silent = true, desc = "highlight references" }
)