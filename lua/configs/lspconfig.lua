local lspconfig = require ("lspconfig")

local on_attach = require ("configs.lsp.configs.on_attach")
local on_init = require ("configs.lsp.configs.on_init")
local capabilities = require ("configs.lsp.configs.capabilities")

local default_vim_lsp_api_bindings = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

local servers = {
    { name = "volar" },
    { name = "html" },
    { name = "cssls" },
    { name = "somesass_ls" },
    { name = "prismals" },
    { name = "ts_ls", opts = require ("configs.lsp.ts_ls") },
    -- { name = "denols", opts = require ("configs.lsp.denols") },
    -- { name = "tailwindcss", opts = require ("configs.lsp.tailwind") },
    { name = "bashls" },
    { name = "lua_ls", opts = require ("configs.lsp.lua") },
    { name = "clangd" },
    { name = "pyright" },
    { name = "cmake" },
    { name = "dockerls" },
    { name = "jsonls" },
    { name = "yamlls" },
    { name = "marksman" },
    { name = "zls" },
    { name = "gopls" },
}

for _, lsp in ipairs (servers) do
    dofile (vim.g.base46_cache .. "lsp")
    require ("nvchad.lsp").diagnostic_config ()
    lspconfig[lsp.name].setup (lsp.opts or default_vim_lsp_api_bindings)
end
