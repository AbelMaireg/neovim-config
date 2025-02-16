return {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    single_file_support = false,
    root_dir = vim.fs.root("package.json", "package.json"),
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                    .. "/mason/packages/vue-language-server/node_modules"
                    .. "/@vue/language-server/node_modules"
                    .. "/@vue/typescript-plugin",
                languages = { "vue" },
            },
        },
    },
    filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
}