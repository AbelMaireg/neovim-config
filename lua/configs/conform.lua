return {
    formatters_by_ft = {
        bash = {
            "shfmt",
        },
        docker = {
            "dockerls",
        },
        dart = {
            "dart_format",
        },
        fish = {
            "shfmt",
        },
        java = {
            "google-java-format",
        },
        javascript = {
            "eslint_d",
            "prettierd",
            "prettier",
            "oxlint",
            stop_after_first = true,
        },
        kotlin = {
            "ktfmt",
            "ktlint",
            stop_after_first = true,
        },
        lua = { "stylua" },
        makefile = {
            "checkmate",
        },
        nginx = {
            "nginx_config_formatter",
        },
        php = {
            "php-cs-fixer",
        },
        python = {
            "pyink",
        },
        typescript = {
            "prettier",
            "prettierd",
            "standardjs",
            "eslint_d",
            "oxlint",
            stop_after_first = true,
        },
        sql = {
            "sql_formatter",
        },
        toml = {
            "taplo",
        },
        vue = {
            "eslint_d",
            "prettierd",
            "prettier",
            "oxlint",
            stop_after_first = true,
        },
        xml = {
            "xmlformatter",
        },
        yaml = {
            "yamlfmt",
            "yamllint",
            stop_after_first = true,
        },
        zig = {
            "zls",
        },
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
    formatters = {
        ["php-cs-fixer"] = {
            command = "php-cs-fixer",
            args = {
                "fix",
                "$FILENAME",
            },
            stdin = false,
        },
    },
}
