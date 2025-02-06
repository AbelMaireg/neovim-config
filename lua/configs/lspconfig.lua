require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_handler = {
    function(server)
        lspconfig[server].setup({ vim_lsp_api_bindings })
    end,
}

local vim_lsp_api_bindings = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
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

lsp_handler["ts_ls"] = require("configs.lsp.ts_ls")
-- lsp_handler["denols"] = require("configs.lsp.denols")

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = servers,
    handler = lsp_handler,
})