return {
    root_dir = vim.fs.root ("0", ".git"),
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath ("data")
                    .. "/mason/packages/"
                    .. "/vue-language-server/node_modules/"
                    .. "/@vue/language-server",
                languages = { "vue" },
            },
        },
    },
    filetypes = {
        "typescript",
        "javascript",
        "vue",
    },
}
