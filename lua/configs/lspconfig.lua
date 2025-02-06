require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

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

function ts_ls_setup()
    local vue_typescript_plugin_path = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules"
        .. "/@vue/language-server/node_modules"
        .. "/@vue/typescript-plugin"

    lspconfig.ts_ls.setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
        single_file_support = false,
        init_options = {
            plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vue_typescript_plugin_path,
                    languages = { "vue" },
                },
            },
        },
        filetypes = {
            "typescript",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "vue",
        },
    })
end

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = servers,
    handler = {
        function(server)
            lspconfig[server].setup({ vim_lsp_api_bindings })
        end,
        volar = function()
            lspconfig.volar.setup({ vim_lsp_api_bindings })
        end,
        ts_ls = ts_ls_setup(),
    },
})

for _, lsp in ipairs(servers) do
    -- if lsp == "denols" then
    --     config.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
    -- elseif lsp == "ts_ls" then
    --     config.root_dir = lspconfig.util.root_pattern "package.json"
    --     config.single_file_support = false
    -- end

    if lsp == "ts_ls" then
        ts_ls_setup()
    else
        lspconfig[lsp].setup(vim_lsp_api_bindings)
    end
end