require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local default_vim_lsp_api_bindings = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

local servers = {
    { "volar",    nil },
    { "bashls",   nil },
    { "clangd",   nil },
    { "cmake",    nil },
    { "cssls",    nil },
    { "denols",   nil },
    { "dockerls", nil },
    { "html",     nil },
    { "jsonls",   nil },
    { "marksman", nil },
    { "prismals", nil },
    { "pyright",  nil },
    { "ts_ls",    require("configs.lsp.ts_ls") },
    { "yamlls",   nil },
}

for _, lsp in ipairs(servers) do
    if lsp[2] == nil then
        lspconfig[lsp[1]].setup(default_vim_lsp_api_bindings)
    else
        lspconfig[lsp[1]].setup(lsp[2])
    end
end