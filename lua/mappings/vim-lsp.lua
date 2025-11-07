local map = vim.keymap.set

map ("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

map ("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

map ("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

map ("n", "<leader>S", function ()
    vim.lsp.buf.signature_help ({
        border = "rounded",
    })
end, { desc = "Show signature help" })

map (
    "n",
    "<leader>wa",
    vim.lsp.buf.add_workspace_folder,
    { desc = "Add workspace folder" }
)

map (
    "n",
    "<leader>wr",
    vim.lsp.buf.remove_workspace_folder,
    { desc = "Remove workspace folder" }
)

map ("n", "<leader>wl", function ()
    print (vim.inspect (vim.lsp.buf.list_workspace_folders ()))
end, { desc = "List workspace folders" })

map (
    "n",
    "<leader>D",
    vim.lsp.buf.type_definition,
    { desc = "Go to type definition" }
)

map ("n", "gr", vim.lsp.buf.references, { desc = "Show references" })

map (
    "n",
    "<leader>sb",
    vim.lsp.buf.rename,
    { noremap = true, silent = true, desc = "rename word" }
)

map (
    "n",
    "gd",
    vim.lsp.buf.definition,
    { noremap = true, silent = true, desc = "go to definition" }
)

map (
    "n",
    "<leader><leader>",
    -- vim.lsp.buf.code_action,
    require ("tiny-code-action").code_action,
    {
        noremap = true,
        silent = true,
        desc = "lsp code action",
    }
)

map ("n", "K", function ()
    vim.lsp.buf.hover ({ border = "double", max_width = 100, max_height = 30 })
end, { noremap = true, silent = true, desc = "lsp hover" })
