return {
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
            "prettier",
            "prettierd",
            "standardjs",
            "eslint_d",
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
        kotlin = {
            "ktfmt",
            -- "ktlint",
        },
        bash = {
            "shfmt",
        },
        fish = {
            "shfmt",
        },
        yaml = {
            "yamlfmt",
            "yamllint",
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
        toml = {
            "taplo",
        },
        xml = {
            "xmlformatter",
        },
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
}
