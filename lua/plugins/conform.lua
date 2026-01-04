return {
    {
        "stevearc/conform.nvim",
        config = function ()
            local conform = require ("conform")
            local configs = require ("configs.conform")

            conform.setup (configs)
        end,
    },
}
