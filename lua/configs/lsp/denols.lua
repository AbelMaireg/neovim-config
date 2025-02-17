local lspconfig = require ("lspconfig")

return {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  single_file_support = false,
  root_dir = vim.fs.root ("deno.json", ".git"),
}
