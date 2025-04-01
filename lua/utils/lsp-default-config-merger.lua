local merger = require ("utils.deep-merge-tables")

return function (custom)
    local default = {}
    merger (default, require ("configs.lsp.configs.defaults"))

    if custom == nil then
        return default
    end

    merger (default, custom)
    return default
end
