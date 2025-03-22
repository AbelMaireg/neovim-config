local map = vim.keymap.set

map ("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map ("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
