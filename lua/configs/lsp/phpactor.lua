return {
    root_dir = function (_)
        return vim.loop.cwd ()
    end,
    init_options = {
        ["language_server_phpstan.enabled"] = true,
        ["language_server_psalm.enabled"] = true,
    },
}
