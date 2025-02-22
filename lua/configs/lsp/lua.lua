local custom = {
    root_dir = vim.fs.root ("init.lua", ".git"),
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand ("$VIMRUNTIME/lua"),
                    vim.fn.expand ("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath ("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath ("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/luv/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

default_lsp_config_merger = require ("utils.lsp-default-config-merger")
return default_lsp_config_merger (custom)
