return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        dependecies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = {
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Leader>si",
                    node_incremental = "<Leader>si",
                    scope_incremental = "<Leader>ss",
                    node_decremental = "<Leader>sd",
                },
            },
            ensure_installed = {
                "ada",
                "agda",
                "angular",
                "apex",
                "arduino",
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "cpp",
                "css",
                "dart",
                "dockerfile",
                "elixir",
                "elm",
                "erlang",
                "go",
                "graphql",
                "haskell",
                "html",
                "java",
                "javascript",
                "json",
                "julia",
                "kotlin",
                "lua",
                "markdown",
                "php",
                "prisma",
                "python",
                "ruby",
                "rust",
                "scala",
                "sql",
                "svelte",
                "typescript",
                "vim",
                "vimdoc",
                "vue",
                "zig",
                "yaml",
            },
        },
        configs = function ()
            require ("nvim-treesitter.configs").setup ({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = {
                                query = "@class.inner",
                                desc = "Select inner part of a class region",
                            },
                            ["as"] = {
                                query = "@local.scope",
                                query_group = "locals",
                                desc = "Select language scope",
                            },
                        },
                        selection_modes = {
                            ["@parameter.outer"] = "v", -- charwise
                            ["@function.outer"] = "V", -- linewise
                            ["@class.outer"] = "<c-v>", -- blockwise
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
}
