return {
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = true,
        ft = { "rust" },
        config = function ()
            require ("mappings.vim-lsp")
            require ("mappings.vim-diagonistics")
        end,
    },

    {
        "saecki/crates.nvim",
        ft = { "toml" },
        config = function ()
            require ("crates").setup ({
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            })
            require ("cmp").setup.buffer ({
                sources = { { name = "crates" } },
            })
        end,
    },
}
