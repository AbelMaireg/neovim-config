return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    event = "LspAttach",
    opts = {
        picker = {
            "buffer",
            opts = {
                hotkeys = true,
                hotkeys_mode = "text_diff_based",
                auto_preview = true,
                auto_accept = false,
                position = "cursor",
                winborder = "single",
                keymaps = {
                    preview = "K",
                    close = { "q", "<Esc>" },
                    select = "<CR>",
                },
                custom_keys = {
                    { key = "m", pattern = "Fill match arms" },
                    { key = "r", pattern = "Rename.*" },
                },
            },
        },
    },
}
