require ("configs.nvterm")

---@type ChadrcConfig
local M = {}

M.ui = {
    statusline = {
        theme = "minimal",
        separator_style = "default",
    },
}

M.base46 = {
    theme = "rosepine",
    transparency = false,

    hl_override = {
        ["@comment"] = { fg = "#afafaf", italic = true },
    },
}

M.colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
}

return M
