require "nvchad.options"

local api = vim.api
local opt = vim.opt

-- visuals
opt.cursorline = true
opt.cursorlineopt = "both"
api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
api.nvim_set_hl(0, "Visual", { bg = "#505050", underline = true })
opt.scrolloff = 10
opt.relativenumber = true

opt.foldmethod = "indent"
opt.foldenable = true
opt.foldlevel = 99
opt.foldnestmax = 10
opt.foldlevelstart = 99

opt.clipboard = "unnamedplus"

opt.shiftwidth = 4

opt.swapfile = false
opt.backup = false
opt.writebackup = false
