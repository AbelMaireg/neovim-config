return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = require ("configs.noice"),
    config = function (_, opts)
        -- HACK: noice shows messages from before it was enabled,
        -- but this is not ideal when Lazy is installing plugins,
        -- so clear the messages in this case.
        if vim.o.filetype == "lazy" then
            vim.cmd ([[messages clear]])
        end
        require ("noice").setup (opts)
    end,
}
