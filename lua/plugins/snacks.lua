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
            dashboard = {
                enabled = true,
                preset = {
                    header = [[AbelMaireg]],
                },
            },
            explorer = { enabled = false },
            gitbrowse = { enabled = true },
            indent = { enabled = true },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = true },
            quickfile = { enabled = false },
            scope = {
                enabled = true,
                keys = {
                    jump = {
                        ["zk"] = {
                            min_size = 1,
                            bottom = false,
                            cursor = false,
                            edge = true,
                            treesitter = { blocks = { enabled = true } },
                            desc = "jump to top edge of scope",
                        },
                        ["zj"] = {
                            min_size = 1,
                            bottom = true,
                            cursor = false,
                            edge = true,
                            treesitter = { blocks = { enabled = true } },
                            desc = "jump to bottom edge of scope",
                        },
                    },
                },
            },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
}