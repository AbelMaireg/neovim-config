return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = true,
        ft = { "rust" },
        config = function ()
            local mason_registry = require ("mason-registry")
            local codelldb = mason_registry.get_package ("codelldb")
            local extension_path = codelldb:get_install_path () .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            local cfg = require ("rustaceanvim.config")

            vim.g.rustaceanvim = {
                dap = {
                    adapter = cfg.get_codelldb_adapter (
                        codelldb_path,
                        liblldb_path
                    ),
                },
            }

            require ("mappings.vim-lsp")
            require ("mappings.vim-diagonistics")
        end,
    },

    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end,
    },

    {
        "saecki/crates.nvim",
        ft = { "toml" },
        config = function ()
            require ("crates").setup ({
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            })
            require ("cmp").setup.buffer ({
                sources = { { name = "crates" } },
            })
        end,
    },

    {
        "nwiizo/cargo.nvim",
        build = "cargo build --release",
        config = function ()
            require ("cargo").setup ({
                float_window = true,
                window_width = 0.8,
                window_height = 0.8,
                border = "rounded",
            })
        end,
        ft = { "rust" },
        cmd = {
            "CargoBench",
            "CargoBuild",
            "CargoClean",
            "CargoDoc",
            "CargoNew",
            "CargoRun",
            "CargoTest",
            "CargoUpdate",
        },
    },
}
