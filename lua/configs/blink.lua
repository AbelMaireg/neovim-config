---@module 'blink.cmp'
---@type blink.cmp.Config
return {
    keymap = {
        preset = "none",
        ["<C-s>"] = {
            "show",
            "show_documentation",
            "hide_documentation",
        },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-f>"] = { "snippet_forward", "fallback" },
        ["<C-b>"] = { "snippet_backward", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
        ["<Tab>"] = { "select_next", "fallback_to_mappings" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 400,
            window = {
                border = "rounded",
            },
        },
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
        menu = {
            border = "bold",
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    appearance = {
        highlight_ns = vim.api.nvim_create_namespace ("blink_cmp"),
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
        kind_icons = {
            Text = "󰉿",
            Method = "󰊕",
            Function = "󰊕",
            Constructor = "󰒓",

            Field = "󰜢",
            Variable = "󰆦",
            Property = "󰖷",

            Class = "󱡠",
            Interface = "󱡠",
            Struct = "󱡠",
            Module = "󰅩",

            Unit = "󰪚",
            Value = "󰦨",
            Enum = "󰦨",
            EnumMember = "󰦨",

            Keyword = "󰻾",
            Constant = "󰏿",

            Snippet = "󱄽",
            Color = "󰏘",
            File = "󰈔",
            Reference = "󰬲",
            Folder = "󰉋",
            Event = "󱐋",
            Operator = "󰪚",
            TypeParameter = "󰬛",
        },
    },
}
