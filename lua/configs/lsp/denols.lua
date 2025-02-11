local lspconfig = require("lspconfig")

return {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json"),
}
