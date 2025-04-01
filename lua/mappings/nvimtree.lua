local map = vim.keymap.set

map (
    "n",
    "<C-n>",
    "<cmd>NvimTreeToggle<CR><cmd>wincmd=<CR>",
    { desc = "nvimtree toggle window" }
)
map (
    "n",
    "<leader>e",
    "<cmd>NvimTreeFocus<CR>",
    { desc = "nvimtree focus window" }
)
