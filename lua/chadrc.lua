require ("utils.contains")
ui_utils = require ("utils.ui")

---@type ChadrcConfig
local M = {}

M.ui = {
    statusline = {
        theme = "minimal",
        separator_style = "default",
        order = {
            "mode",
            "cwd",
            "file",
            "git",
            "%=",
            "%=",
            "lsp_msg",
            "diagnostics",
            "lsp",
            "copilot",
            "null_ls",
            "cursor",
            "lines",
        },
        modules = {
            -- git = function()
            --     local data = ui_utils.git()
            --     return "%#St_InsertModeSep# "
            --         .. data[1]
            --         .. " %#St_TerminalmodeSep#"
            --         .. data[2]
            --         .. " %#St_NTerminalmodeSep#"
            --         .. data[3]
            --         .. " %#St_file_sep#"
            --         .. data[4]
            -- end,
            lsp = function ()
                local exo = { "null-ls", "GitHub Copilot" }

                if rawget (vim, "lsp") then
                    for _, client in ipairs (vim.lsp.get_clients ()) do
                        if contains (exo, client.name) then
                            goto continue
                        end
                        if
                            client.attached_buffers[vim.api.nvim_win_get_buf (0)]
                        then
                            return (
                                vim.o.columns > 100
                                and "   " .. client.name .. " "
                            ) or "   "
                        end
                        ::continue::
                    end
                end

                return ""
            end,
            null_ls = function ()
                for _, client in ipairs (vim.lsp.get_clients ()) do
                    if client.name == "null-ls" then
                        return "✨ "
                    end
                end

                return ""
            end,
            copilot = function ()
                for _, client in ipairs (vim.lsp.get_clients ()) do
                    if client.name == "GitHub Copilot" then
                        return "👾 "
                    end
                end

                return ""
            end,
            cursor = "%#St_file_txt#%4l :%3c ",
            lines = function ()
                return "%#St_File_bg# "
                    .. vim.api.nvim_buf_line_count (0)
                    .. " "
            end,
        },
    },
}

M.base46 = {
    theme = "onedark",
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
