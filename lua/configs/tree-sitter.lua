return {
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
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "go",
        "graphql",
        "html",
        "java",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "markdown",
        "php",
        "prisma",
        "python",
        "regex",
        "rust",
        "sql",
        "typescript",
        "xml",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
        "zig",
    },
}
