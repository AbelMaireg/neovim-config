require("configs.nvterm")

---@type ChadrcConfig
local M = {}

M.ui = {
    statusline = {
        theme = "vscode_colored",
        separator_style = "default",
        -- order = {
        --     "mode",
        --     "git",
        --     "%=",
        --     "lsp_msg",
        --     "%=",
        --     "lsp",
        --     "cwd",
        --     "cursor",
        -- "location",
        -- },
        -- modules = {
        --     lsp = function()
        --         if rawget(vim, "lsp") then
        --             for _, client in ipairs(vim.lsp.get_clients()) do
        --                 if client.name == "null-ls" then
        --                     goto continue
        --                 end
        --                 if
        --                     client.attached_buffers[vim.api.nvim_win_get_buf(
        --                         vim.g.statusline_winid or 0
        --                     )]
        --                 then
        --                     return (
        --                         vim.o.columns > 100
        --                         and "   LSP ~ " .. client.name .. " "
        --                     ) or "   LSP "
        --                 end
        --                 ::continue::
        --             end
        --         end
        --
        --         return ""
        --     end,
        --     location = "%#StText# ln: %l, col: %c ",
        -- },
    },
}

M.base46 = {
    theme = "jellybeans",
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