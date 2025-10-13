---@type NoiceConfig
return {
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
            position = {
                row = "90%",
                col = "50%",
            },
        },
    },
    messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
    },
    popupmenu = {
        enabled = true,
        backend = "nui",
    },
    redirect = {
        view = "popup",
        filter = { event = "msg_show" },
    },
    commands = {
        history = {
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {
                any = {
                    { event = "notify" },
                    { error = true },
                    { warning = true },
                    { event = "msg_show", kind = { "" } },
                    { event = "lsp", kind = "message" },
                },
            },
            filter_opts = {},
        },
        last = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = {
                any = {
                    { event = "notify" },
                    { error = true },
                    { warning = true },
                    { event = "msg_show", kind = { "" } },
                    { event = "lsp", kind = "message" },
                },
            },
            filter_opts = { count = 1 },
        },
        errors = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = { error = true },
            filter_opts = { reverse = true },
        },
        all = {
            view = "split",
            opts = { enter = true, format = "details" },
        },
    },
    notify = {
        enabled = true,
        view = "notify",
    },
    lsp = {
        progress = {
            enabled = true,
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 1000 / 30,
            view = "mini",
        },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false,
        },
        hover = {
            enabled = false,
        },
        signature = {
            enabled = false,
        },
        message = {
            enabled = false,
        },
        documentation = {
            enabled = false,
        },
    },
    markdown = {
        hover = {
            ["|(%S-)|"] = vim.cmd.help,
            ["%[.-%]%((%S-)%)"] = require ("noice.util").open,
        },
        highlights = {
            ["|%S-|"] = "@text.reference",
            ["@%S+"] = "@parameter",
            ["^%s*(Parameters:)"] = "@text.title",
            ["^%s*(Return:)"] = "@text.title",
            ["^%s*(See also:)"] = "@text.title",
            ["{%S-}"] = "@parameter",
        },
    },
    health = {
        checker = true,
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
    },
    throttle = 100,
}
