return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = require ("configs.textobjects"),
    config = function (_, opts)
        require ("nvim-treesitter.configs").setup (opts)
    end,
}
