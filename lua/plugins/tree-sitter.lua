return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        dependecies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = require ("configs.tree-sitter"),
    },
}
