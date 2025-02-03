require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_registry = require "mason-registry"

mason.setup {}
mason_lspconfig.setup {
    ensure_installed = {
        "ts_ls",
        "volar",
    },
    handler = {
        function(server)
            lspconfig[server].setup {}
        end,
        volar = function()
            lspconfig.volar.setup {}
        end,
        ts_ls = function()
            local vue_typescript_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
                .. "/node_modules/@vue/language-server"

            lspconfig.ts_ls.setup {
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_typescript_server_path,
                            languages = { "vue", "javascript", "typescript" },
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "javascript.jsx",
                    "javascriptreact",
                    "typescript",
                    "typescript.tsx",
                    "typescriptreact",
                    "vue",
                },
            }
        end,
    },
}

local servers = {
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    -- "denols",
    "dockerls",
    "html",
    "jsonls",
    "marksman",
    "prismals",
    "pyright",
    "ts_ls",
    "volar",
    "yamlls",
}

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }

    -- if lsp == "denols" then
    --     config.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
    -- elseif lsp == "ts_ls" then
    --     config.root_dir = lspconfig.util.root_pattern "package.json"
    --     config.single_file_support = false
    -- end

    lspconfig[lsp].setup(config)
end

local dap = require "dap"
dap.adapters.codelldb = {
    type = "server",
    host = "127.0.0.1",
    port = 13000,
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.getcwd() .. "/build/bin"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
    },
}

dap.configurations.rust = {
    {
        type = "lldb",
        request = "launch",
        cargo = {
            args = { "test", "--no-run", "--lib" },
            env = { RUSTFLAGS = "-Clinker=ld.mold" },
            cwd = "${workspaceFolder}",
            problemMatcher = "$rustc",
            filter = {
                name = "mylib",
                kind = "lib",
            },
        },
    },
}
