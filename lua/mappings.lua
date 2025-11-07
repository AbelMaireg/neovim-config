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
require ("mappings.copilot")

Map = vim.keymap.set
-- local nomap = vim.keymap.del

Map ("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
Map ("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

Map ("n", ";", ":", { desc = "CMD enter command mode" })
