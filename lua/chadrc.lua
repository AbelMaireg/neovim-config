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
            "macro_recording",
            "lsp_msg",
            "diagnostics",
            "lsp",
            "copilot",
            "cursor",
            "lines",
        },
        modules = {
            git = function ()
                return "%#St_gitIcons#" .. require ("nvchad.stl.utils").git ()
            end,
            lsp = function ()
                local exclude = { "GitHub Copilot" }

                if rawget (vim, "lsp") then
                    for _, client in ipairs (vim.lsp.get_clients ()) do
                        if contains (exclude, client.name) then
                            goto continue
                        end
                        if
                            client.attached_buffers[vim.api.nvim_win_get_buf (0)]
                        then
                            return (
                                vim.o.columns > 100
                                and "   " .. client.name .. " "
                            ) or "  "
                        end
                        ::continue::
                    end
                end

                return ""
            end,
            copilot = function ()
                for _, client in ipairs (vim.lsp.get_clients ()) do
                    if client.name == "GitHub Copilot" then
                        return " 👾 "
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
            macro_recording = function ()
                if vim.fn.reg_recording () ~= "" then
                    return "%#St_file_bg# "
                        .. "REC "
                        .. "%#St_file_txt# "
                        .. vim.fn.reg_recording ()
                        .. " "
                end
                return ""
            end,
        },
    },
}

M.base46 = {
    theme = "ayu_dark",
    transparency = false,
    theme_toggle = { "tokyonight", "ayu_dark" },

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
