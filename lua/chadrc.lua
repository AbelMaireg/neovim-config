-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
    statusline = {
        theme = "minimal",
        separator_style = "block",
    },
}

M.base46 = {
    theme = "radium",
    transparency = true,

    hl_override = {
        ["@comment"] = { fg = "#afafaf", italic = true },
    },
}

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            require("nvim-tree.api").tree.open()
        end
    end,
})

require("nvterm").setup({
    terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.8,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.33 },
            vertical = { location = "rightbelow", split_ratio = 0.33 },
        },
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
})

return M
