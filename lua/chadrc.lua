require("configs.nvterm")

---@type ChadrcConfig
local M = {}

M.ui = {
    statusline = {
        theme = "minimal",
        separator_style = "block",
    },
}

M.base46 = {
    theme = "rosepine",
    transparency = true,

    hl_override = {
        ["@comment"] = { fg = "#afafaf", italic = true },
    },
}

return M