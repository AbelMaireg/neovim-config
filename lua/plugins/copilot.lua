return {
    "github/copilot.vim",
    lazy = false,
    configs = function ()
        vim.call ("copilot#Enable")
        vim.g.copilot_no_tab_map = true
    end,
}
