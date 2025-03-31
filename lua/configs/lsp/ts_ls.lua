inlay_hint_conf_gen = require ("utils.inlay-hint-conf-gen")

return {
    single_file_support = false,
    root_dir = vim.fs.root ("package.json", ".git"),
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath ("data")
                    .. "/mason/packages/vue-language-server/node_modules"
                    .. "/@vue/language-server/node_modules"
                    .. "/@vue/typescript-plugin",
                languages = { "vue" },
            },
        },
        hybridMode = false,
    },
    filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
    settings = {
        javascript = {
            inlayHints = inlay_hint_conf_gen (),
        },
        typescript = {
            inlayHints = inlay_hint_conf_gen (),
        },
        vue = {
            inlayHints = inlay_hint_conf_gen (),
        },
    },
    inlay_hints = {
        enabled = true,
    },
}
