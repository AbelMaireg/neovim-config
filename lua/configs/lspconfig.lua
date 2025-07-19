local lspconfig = require ("lspconfig")
lsp_default_config_merger = require ("utils.lsp-default-config-merger")

local servers = {
    {
        name = "volar",
        enable = true,
        priority = 2,
    },
    {
        name = "html",
        enable = true,
    },
    {
        name = "cssls",
        enable = true,
    },
    {
        name = "somesass_ls",
        enable = true,
    },
    {
        name = "tailwindcss",
        setup = require ("configs.lsp.tailwind"),
        enable = true,
    },
    {
        name = "prismals",
        enable = true,
    },
    {
        name = "ts_ls",
        setup = require ("configs.lsp.ts_ls"),
        enable = true,
        priority = 1,
    },
    {
        name = "denols",
        setup = require ("configs.lsp.denols"),
        enable = false,
        priority = 1,
    },
    {
        name = "bashls",
        enable = true,
    },
    {
        name = "lua_ls",
        setup = require ("configs.lsp.lua"),
        enable = true,
    },
    {
        name = "clangd",
        enable = true,
    },
    {
        name = "pyright",
        enable = true,
    },
    {
        name = "cmake",
        enable = true,
    },
    {
        name = "dockerls",
        enable = true,
    },
    {
        name = "docker_compose_language_service",
        enable = true,
    },
    {
        name = "jsonls",
        enable = true,
    },
    {
        name = "yamlls",
        enable = true,
    },
    {
        name = "taplo",
        enable = true,
    },
    {
        name = "marksman",
        enable = true,
    },
    {
        name = "zls",
        enable = true,
    },
    {
        name = "gopls",
        enable = true,
    },
    {
        name = "jdtls",
        enable = true,
    },
    {
        name = "gradle_ls",
        enable = true,
    },
    {
        name = "groovyls",
        enable = true,
    },
    {
        name = "kotlin_language_server",
        enable = false,
    },
    {
        name = "sqls",
        enable = true,
    },
    {
        name = "nginx_language_server",
        enable = true,
    },
    {
        name = "phpactor",
        enable = false,
        setup = require ("configs.lsp.phpactor"),
    },
    {
        name = "intelephense",
        enable = true,
    },
}

table.sort (servers, function (a, b)
    return (a.priority or 0) > (b.priority or 0)
end)

for _, lsp in ipairs (servers) do
    if lsp.enable == true then
        dofile (vim.g.base46_cache .. "lsp")
        require ("nvchad.lsp").diagnostic_config ()
        lspconfig[lsp.name].setup (lsp_default_config_merger (lsp.setup))
    end
end
