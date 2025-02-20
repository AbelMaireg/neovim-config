function inlayHintsConfigGenPerLang (
    enum,
    func_like_return,
    func_param,
    param_name,
    param_name_arg_match,
    prop_decl,
    variable_type
)
    return {
        includeInlayEnumMemberValueHints = enum or true,
        includeInlayFunctionLikeReturnTypeHints = func_like_return or true,
        includeInlayFunctionParameterTypeHints = func_param or true,
        includeInlayParameterNameHints = param_name or "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = param_name_arg_match
            or true,
        includeInlayPropertyDeclarationTypeHints = prop_decl or true,
        includeInlayVariableTypeHints = variable_type or true,
    }
end

return {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    single_file_support = false,
    root_dir = vim.fs.root ("package.json", ".git"),
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath ("data")
                    .. "/mason/packages/vue-language-server/node_modules"
                    .. "/@vue/language-server/node_modules"
                    .. "/@vue/typescript-plugin",
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
    settings = {
        javascript = {
            inlayHints = inlayHintsConfigGenPerLang (),
        },
        typescript = {
            inlayHints = inlayHintsConfigGenPerLang (),
        },
        vue = {
            inlayHints = inlayHintsConfigGenPerLang (),
        },
    },
    inlay_hints = {
        enabled = true,
    },
}
