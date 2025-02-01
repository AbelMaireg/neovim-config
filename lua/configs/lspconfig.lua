require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
    "html",
    "cssls",
    "ts_ls",
    "denols",
    "vuels",
    "dockerls",
    "yamlls",
    "clangd",
    "pyright",
    "cmake",
    "prismals",
    "jsonls",
    "marksman",
    "bashls",
}

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }

    if lsp == "denols" then
        config.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
    elseif lsp == "ts_ls" then
        config.root_dir = lspconfig.util.root_pattern "package.json"
        config.single_file_support = false
    end

    lspconfig[lsp].setup(config)
end

local dap = require "dap"
dap.adapters.codelldb = {
    type = "server",
    host = "127.0.0.1",
    port = 13000,
}

-- dap.adapters.codelldb = {
--     type = "server",
--     port = "${port}",
--     executable = {
--         command = "/home/abelmaireg/.local/share/nvim/mason/bin/codelldb",
--         args = { "--port", "${port}" },
--     },
-- }

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
            args = { "test", "--no-run", "--lib" }, -- Cargo command line to build the debug target
            env = { RUSTFLAGS = "-Clinker=ld.mold" }, -- Extra environment variables.
            cwd = "${workspaceFolder}",         -- Cargo working directory.
            problemMatcher = "$rustc",          -- Problem matcher(s) to apply to cargo output.
            filter = {                          -- Filter applied to compilation artifacts.
                name = "mylib",
                kind = "lib",
            },
        },
    },
}

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
    command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
    command = ":silent !kitty @ set-spacing padding=20 margin=10",
})
