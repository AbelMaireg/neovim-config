lsp_default_config_merger = require ("utils.lsp-default-config-merger")

local servers = {
    -- Web Development
    {
        name = "vue_ls",
        setup = require ("configs.lsp.vue_ls"),
        enable = true,
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
        name = "ts_ls",
        setup = require ("configs.lsp.ts_ls"),
        enable = true,
    },
    {
        name = "denols",
        setup = require ("configs.lsp.denols"),
        enable = false,
    },
    {
        name = "somesass_ls",
        enable = false,
    },
    {
        name = "tailwindcss",
        setup = require ("configs.lsp.tailwind"),
        enable = true,
    },
    {
        name = "prismals",
        enable = true,
        setup = {
            cmd = { "/home/severus/.bun/bin/prisma-language-server", "--stdio" },
        },
    },

    -- Shell, JSON, YAML, Markdown, etc.
    { name = "bashls", enable = true },
    {
        name = "lua_ls",
        enable = true,
        setup = require ("configs.lsp.lua"),
    },
    { name = "dockerls", enable = true },
    { name = "docker_compose_language_service", enable = true },
    { name = "jsonls", enable = true },
    -- { name = "yamlls", enable = true },
    { name = "taplo", enable = true },
    { name = "marksman", enable = true },

    -- C/C++
    {
        name = "clangd",
        enable = true,
        setup = require ("configs.lsp.clangd"),
    },
    { name = "cmake", enable = true },

    -- JVM Languages
    { name = "jdtls", enable = true },
    { name = "gradle_ls", enable = true },
    { name = "groovyls", enable = true },
    { name = "kotlin_language_server", enable = false },

    -- PHP
    {
        name = "phpactor",
        enable = false,
        setup = require ("configs.lsp.phpactor"),
    },
    { name = "intelephense", enable = true },

    -- Others
    { name = "gopls", enable = true },
    { name = "nginx_language_server", enable = true },
    { name = "protols", enable = true },
    { name = "pyright", enable = true },
    { name = "sqls", enable = true },
    { name = "zls", enable = true },
    { name = "rust_analyzer", enable = true },
    { name = "csharp_ls", enable = true },
}

table.sort (servers, function (a, b)
    return (a.priority or 0) > (b.priority or 0)
end)

for _, lsp in ipairs (servers) do
    if lsp.enable == true then
        dofile (vim.g.base46_cache .. "lsp")
        vim.lsp.config (lsp.name, lsp_default_config_merger (lsp.setup))
        vim.lsp.enable ({ lsp.name })
    end
end
