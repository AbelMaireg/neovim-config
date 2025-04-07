return {
    {
        "stevearc/conform.nvim",
        config = function ()
            require ("conform").setup (require ("configs.conform"))
        end,
    },
}
