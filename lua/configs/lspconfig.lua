require ("nvchad.configs.lspconfig").defaults ()

local lspconfig = require ("lspconfig")

local default_vim_lsp_api_bindings = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

local servers = {
  { name = "volar" },
  { name = "html" },
  { name = "cssls" },
  { name = "prismals" },
  { name = "denols", opts = require ("configs.lsp.denols") },
  { name = "ts_ls", opts = require ("configs.lsp.ts_ls") },
  { name = "tailwindcss", opts = require ("configs.lsp.tailwind") },

  { name = "bashls" },
  { name = "clangd" },
  { name = "pyright" },
  { name = "cmake" },
  { name = "dockerls" },
  { name = "jsonls" },
  { name = "yamlls" },
  { name = "marksman" },
}

for _, lsp in ipairs (servers) do
  lspconfig[lsp.name].setup (lsp.opts or default_vim_lsp_api_bindings)
end
