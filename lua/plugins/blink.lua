return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    lazy = false,

    version = "1.*",

    opts = require ("configs.blink"),
    opts_extend = { "sources.default" },
}
