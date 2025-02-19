require ("mappings.dap")
require ("mappings.nvterm")
require ("mappings.tabufline")
require ("mappings.telescope")
require ("mappings.vim-diagonistics")
require ("mappings.vim-lsp")
require ("mappings.rustaceanvim")
require ("mappings.comment")
require ("mappings.comment")
require ("mappings.motions")
require ("mappings.nvimtree")
require ("mappings.whichkey")

local map = vim.keymap.set
-- local nomap = vim.keymap.del

map ("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map ("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map ("n", ";", ":", { desc = "CMD enter command mode" })
