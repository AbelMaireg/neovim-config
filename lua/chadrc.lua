require ("configs.nvterm")

---@type ChadrcConfig
local M = {}

M.ui = {
    statusline = {
        theme = "minimal",
        separator_style = "default",
        order = {
            "mode",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "cwd",
            "cursor",
        },
        modules = {
            lsp = function ()
                if rawget (vim, "lsp") then
                    for _, client in ipairs (vim.lsp.get_clients ()) do
                        if client.name == "null-ls" then
                            goto continue
                        end
                        if
                            client.attached_buffers[vim.api.nvim_win_get_buf (
                                vim.g.statusline_winid or 0
                            )]
                        then
                            return (
                                vim.o.columns > 100
                                and "   LSP ~ " .. client.name .. " "
                            ) or "   LSP "
                        end
                        ::continue::
                    end
                end

                return ""
            end,
            cursor = "%#StText#%#St_file_txt# l:%3l, c:%3c ",
        },
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
