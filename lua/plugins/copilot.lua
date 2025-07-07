return {
    "github/copilot.vim",
    lazy = false,
    configs = function ()
        vim.call ("copilot#Enable")

        -- ignore env files
        vim.g.copilot_filetypes = {
            ["*"] = true,
            ["env"] = false,
            ["json"] = false,
            ["yaml"] = false,
        }
    end,
}
