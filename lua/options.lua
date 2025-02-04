require("nvchad.options")

local api = vim.api
local opt = vim.opt
local create_autocmd = vim.api.nvim_create_autocmd

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

opt.clipboard = "unnamed"

opt.shiftwidth = 4

opt.swapfile = false
opt.backup = false
opt.writebackup = false

create_autocmd("VimEnter", {
    command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

create_autocmd("VimLeavePre", {
    command = ":silent !kitty @ set-spacing padding=20 margin=10",
})

create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
            on_visual = true,
        })
    end,
})
