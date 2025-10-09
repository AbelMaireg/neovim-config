return {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",

                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",

                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",

                ["as"] = "@statement.outer",

                -- ["as"] = {
                --     query = "@local.scope",
                --     query_group = "locals",
                --     desc = "Select language scope",
                -- },
            },
            selection_modes = {
                ["@parameter.outer"] = "v",
                ["@function.outer"] = "V",
                ["@class.outer"] = "<c-v>",
            },
            include_surrounding_whitespace = true,
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>sn"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>sp"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
                ["]l"] = "@loop.*",
                ["]s"] = {
                    query = "@local.scope",
                    query_group = "locals",
                    desc = "Next scope",
                },
                ["]z"] = {
                    query = "@fold",
                    query_group = "folds",
                    desc = "Next fold",
                },
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
            },
            goto_next = {
                ["]e"] = "@conditional.outer",
            },
            goto_previous = {
                ["[e"] = "@conditional.outer",
            },
        },
        lsp_interop = {
            enable = true,
            border = "none",
            floating_preview_opts = {},
            peek_definition_code = {},
        },
    },
}
