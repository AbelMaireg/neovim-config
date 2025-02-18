return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "pyright",
                "rust-analyzer",
                "clangd",
                "clang-format",
                "typescript-language-server",
                "codelldb",
            },
        },
    },
}
