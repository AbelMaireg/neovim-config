local lspconfig = require ("lspconfig")
lsp_default_config_merger = require ("utils.lsp-default-config-merger")

local servers = {
    {
        name = "volar",
        priority = 2,
    },
    { name = "html" },
    { name = "cssls" },
    { name = "somesass_ls" },
    { name = "prismals" },
    {
        name = "ts_ls",
        setup = require ("configs.lsp.ts_ls"),
        priority = 1,
    },
    { name = "bashls" },
    {
        name = "lua_ls",
        setup = require ("configs.lsp.lua"),
    },
    { name = "clangd" },
    { name = "pyright" },
    { name = "cmake" },
    { name = "dockerls" },
    { name = "docker_compose_language_service" },
    { name = "jsonls" },
    { name = "yamlls" },
    { name = "marksman" },
    { name = "zls" },
    { name = "gopls" },
    { name = "jdtls" },
}

table.sort (servers, function (a, b)
    return (a.priority or 0) > (b.priority or 0)
end)

for _, lsp in ipairs (servers) do
    dofile (vim.g.base46_cache .. "lsp")
    require ("nvchad.lsp").diagnostic_config ()
    lspconfig[lsp.name].setup (lsp_default_config_merger (lsp.setup))
end
