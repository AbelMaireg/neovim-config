return {
    -- single_file_support = false,
    root_dir = vim.fs.root ("tailwind.config.js", ".git"),
    filetypes = {
        "html",
        "css",
        -- "javascript",
        -- "typescript",
        "vue",
        "javascriptreact",
        "typescriptreact",
    },
}
