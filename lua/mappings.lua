require("nvchad.mappings")
require("mappings.dap")
require("mappings.nvterm")
require("mappings.tabufline")
require("mappings.telescope")
require("mappings.vim-diagonistics")
require("mappings.vim-lsp")
require("mappings.rustaceanvim")

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<Leader>h")
nomap("n", "<Leader>v")

map("n", ";", ":", { desc = "CMD enter command mode" })

-- pane
map("n", "<A-Up>", ":resize +1<CR>", { desc = "Increase height" })
map("n", "<A-Down>", ":resize -1<CR>", { desc = "Decrease height" })
map("n", "<A-Left>", ":vertical resize -1<CR>", { desc = "Decrease width" })
map("n", "<A-Right>", ":vertical resize +1<CR>", { desc = "Increase width" })
map("n", "<leader>we", ":wincmd =<CR>", { desc = "Equalize panes size" })

-- motion
map("i", "jk", "<ESC>")
map("n", "<A-k>", ":m .-2<CR>==", { desc = "move line up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move selected line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move selected line down" })