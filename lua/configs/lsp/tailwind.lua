return {
    on_attach = require ("configs.lsp.configs.on_attach"),
    on_init = require ("configs.lsp.configs.on_init"),
    capabilities = require ("configs.lsp.configs.capabilities"),
    single_file_support = false,
    root_dir = vim.fs.root ("tailwind.config.js", ".git"),
}
