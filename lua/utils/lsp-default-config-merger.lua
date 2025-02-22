local merger = require ("utils.deep-merge-tables")

return function (custom)
    return merger (custom, require ("configs.lsp.configs.defaults"))
end
