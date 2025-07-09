return {
    root_dir = function (_)
        return vim.loop.cwd ()
    end,
    init_options = {
        ["language_server.diagnostics_on_update"] = true,
        ["language_server.diagnostics_on_open"] = true,
        ["language_server.diagnostics_on_save"] = true,
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    },
}
