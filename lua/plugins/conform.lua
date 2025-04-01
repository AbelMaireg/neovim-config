return {
    {
        "stevearc/conform.nvim",
        config = function ()
            require ("conform").setup ({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = {
                        "eslint_d",
                        "prettierd",
                        "prettier",
                        "oxlint",
                        stop_after_first = true,
                    },
                    typescript = {
                        "eslint_d",
                        "prettierd",
                        "prettier",
                        "oxlint",
                        stop_after_first = true,
                    },
                    vue = {
                        "eslint_d",
                        "prettierd",
                        "prettier",
                        "oxlint",
                        stop_after_first = true,
                    },
                    java = {
                        "google-java-format",
                    },
                    bash = {
                        "shfmt",
                    },
                    fish = {
                        "shfmt",
                    },
                    yaml = {
                        "yamlfmt",
                    },
                    zig = {
                        "zls",
                    },
                    docker = {
                        "dockerls",
                    },
                    sql = {
                        "sql_formatter",
                    },
                    dart = {
                        "dart_format",
                    },
                },
                format_on_save = {
                    timeout_ms = 1000,
                    lsp_format = "fallback",
                },
            })
        end,
    },
}
