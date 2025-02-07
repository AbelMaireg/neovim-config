return {
    {
        "folke/snacks.nvim",
        dependencies = {
            "echasnovski/mini.icons",
            "nvim-tree/nvim-web-devicons",
        },
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = false },
            dashboard = { enabled = true },
            explorer = { enabled = false },
            indent = { enabled = true },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = true },
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = true },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
    },
}