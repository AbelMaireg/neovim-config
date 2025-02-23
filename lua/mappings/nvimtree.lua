local map = vim.keymap.set

map (
    "n",
    "<C-n>",
    "<cmd>NvimTreeToggle<CR><C-w>=",
    { desc = "nvimtree toggle window" }
)
map (
    "n",
    "<leader>e",
    "<cmd>NvimTreeFocus<CR>",
    { desc = "nvimtree focus window" }
)
