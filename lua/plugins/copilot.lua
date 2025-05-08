return {
    "github/copilot.vim",
    lazy = false,
    configs = function ()
        vim.call ("copilot#Enable")
        vim.g.copilot_no_tab_map = true

        -- ignore env files
        vim.g.copilot_filetypes = {
            ["*"] = true,
            ["env"] = false,
            ["json"] = false,
            ["yaml"] = false,
        }
    end,
}
