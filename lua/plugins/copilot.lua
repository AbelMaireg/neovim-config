return {
    "github/copilot.vim",
    lazy = false,
    configs = function ()
        vim.call ("copilot#Enable")

        vim.g.copilot_filetypes = {
            ["env"] = true,
            ["toml"] = true,
        }
    end,
}
