return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = require ("configs.tree"),
    },
}
