local custom = {
    single_file_support = false,
    root_dir = vim.fs.root ("deno.json", ".git"),
}

default_lsp_config_merger = require ("utils.lsp-default-config-merger")
return default_lsp_config_merger (custom)
