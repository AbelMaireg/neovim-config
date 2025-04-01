return function (
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
