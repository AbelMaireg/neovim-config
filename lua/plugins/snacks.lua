return {
    {
        "folke/snacks.nvim",
        dependencies = {
            "echasnovski/mini.icons",
            "nvim-tree/nvim-web-devicons",
        },
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = false },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[AbelMaireg]],
                },
            },
            explorer = { enabled = false },
            gitbrowse = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = false },
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
                blocks = {
                    enabled = true,
                    "function_declaration",
                    "function_definition",
                    "method_declaration",
                    "method_definition",
                    "class_declaration",
                    "class_definition",
                    "do_statement",
                    "while_statement",
                    "repeat_statement",
                    "if_statement",
                    "for_statement",
                },
            },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = true },
        },
    },
}
