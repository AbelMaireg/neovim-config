require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local default_vim_lsp_api_bindings = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

local servers = {
    { "volar",       nil },
    { "html",        nil },
    { "cssls",       nil },
    { "prismals",    nil },
    -- { "denols",      require("configs.lsp.denols") },
    { "ts_ls",       require("configs.lsp.ts_ls") },
    { "tailwindcss", require("configs.lsp.tailwind") },

    { "bashls",      nil },
    { "clangd",      nil },
    { "pyright",     nil },
    { "cmake",       nil },
    { "dockerls",    nil },
    { "jsonls",      nil },
    { "yamlls",      nil },
    { "marksman",    nil },
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp[1]].setup(lsp[2] or default_vim_lsp_api_bindings)
end