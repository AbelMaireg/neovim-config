return {
    "github/copilot.vim",
    lazy = false,
    configs = function ()
        vim.call ("copilot#Enable")
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_filetypes = {
            "css",
            "html",
            "javascript",
            "lua",
            "markdown",
            "sass",
            "scss",
            "typescript",
        }
        vim.g.copilot_keymap = {
            accept = "<C-J>",
            dismiss = "<M-r>",
            previous = "<M-k>",
            next = "<M-j>",
            accept_word = "<M-l>",
            accept_line = "<M-o>",
        }
    end,
}
