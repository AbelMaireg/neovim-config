return {
    "github/copilot.vim",
    lazy = true,
    configs = function ()
        vim.call ("copilot#Enable")
    end,
}
