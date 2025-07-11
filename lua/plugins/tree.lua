return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function ()
            dofile (vim.g.base46_cache .. "nvimtree")

            return {
                filters = {
                    enable = true,
                    git_ignored = false,
                    dotfiles = false,
                    git_clean = false,
                    no_buffer = false,
                    no_bookmark = false,
                    custom = {
                        ".idea", -- JetBrains IDE files
                        ".vscode", -- Visual Studio Code files
                    },
                    exclude = {},
                },
                disable_netrw = true,
                hijack_cursor = true,
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    cursorline = true,
                    preserve_window_proportions = true,
                    width = 30,
                    float = {
                        enable = false,
                        quit_on_focus_loss = true,
                        open_win_config = {
                            relative = "editor",
                            border = "rounded",
                            width = 36,
                            height = 30,
                            row = 1,
                            col = 1,
                        },
                    },
                },
                renderer = {
                    root_folder_label = false,
                    highlight_git = true,
                    indent_markers = { enable = true },
                    icons = {
                        web_devicons = {
                            file = {
                                enable = true,
                                color = true,
                            },
                            folder = {
                                enable = false,
                                color = true,
                            },
                        },
                        git_placement = "before",
                        modified_placement = "after",
                        hidden_placement = "after",
                        diagnostics_placement = "signcolumn",
                        bookmarks_placement = "signcolumn",
                        padding = {
                            icon = " ",
                            folder_arrow = " ",
                        },
                        symlink_arrow = " ➛ ",
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                            modified = true,
                            hidden = false,
                            diagnostics = true,
                            bookmarks = true,
                        },
                        glyphs = {
                            default = "",
                            symlink = "",
                            bookmark = "󰆤",
                            modified = "●",
                            hidden = "󰜌",
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = false,
                    show_on_open_dirs = true,
                    debounce_delay = 500,
                    severity = {
                        min = vim.diagnostic.severity.HINT,
                        max = vim.diagnostic.severity.ERROR,
                    },
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                filesystem_watchers = {
                    enable = true,
                    debounce_delay = 100,
                    ignore_dirs = {
                        ".git",
                        "/node_modules",
                        "/vendor",
                        "/target",
                        "/logs",
                        "/dist",
                        "/build",
                        "/coverage",
                        "/tmp",
                        "/cache",
                        "/.cache",
                        "/.next",
                        "/.nuxt",
                        "/.vscode",
                        "/.idea",
                    },
                },
            }
        end,
    },
}
