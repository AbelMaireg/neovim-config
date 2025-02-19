local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local eslint_cmd = "eslint_d"
local local_eslint = vim.fn.getcwd() .. "/node_modules/.bin/eslint_d"
if vim.fn.executable(local_eslint) == 1 then
    eslint_cmd = local_eslint
end

local opts = {
    sources = {
        -- Formatters
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "vue", "html", "css" },
        }),
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.oxlint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.dart_format,

        -- Linters(ESLint)
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --     command = eslint_cmd,
        -- }),
        -- null_ls.builtins.code_actions.eslint_d.with({
        --     command = local_eslint,
        -- }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

return opts
