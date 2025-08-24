return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "arthur944/neotest-bun",
        "nvim-neotest/neotest-jest",
        "rouge8/neotest-rust",
    },
    config = function ()
        require ("neotest").setup ({
            adapters = {
                -- bun/javascript
                require ("neotest-bun"),

                -- jest/javascript
                require ("neotest-jest") ({
                    jestCommand = "npm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function (path)
                        return vim.fn.getcwd ()
                    end,
                }),

                -- rust
                require ("neotest-rust"),
            },
        })
    end,
}
