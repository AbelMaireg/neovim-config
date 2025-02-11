require("nvterm").setup({
    terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.8,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.33 },
            vertical = { location = "rightbelow", split_ratio = 0.33 },
        },
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
})
