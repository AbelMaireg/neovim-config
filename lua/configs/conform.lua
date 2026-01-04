local javascript_formatters = {
    "eslint_d",
    "prettier",
    "biome",
    -- "prettierd",
    -- "oxlint",
}

return {
    formatters_by_ft = {
        bash = {
            "shfmt",
        },
        dart = {
            "dart_format",
        },
        docker = {
            "dockerls",
        },
        fish = {
            "shfmt",
        },
        java = {
            "google-java-format",
        },
        javascript = deepMerge (javascript_formatters, {
            stop_after_first = false,
        }),
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
        proto = {
            "protolint",
        },
        python = {
            "pyink",
        },
        typescript = deepMerge (javascript_formatters, {
            stop_after_first = false,
        }),
        sql = {
            "sql_formatter",
        },
        toml = {
            "taplo",
        },
        vue = deepMerge (javascript_formatters, {
            stop_after_first = true,
        }),
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
