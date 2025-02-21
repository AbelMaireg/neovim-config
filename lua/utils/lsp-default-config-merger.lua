local merger = require ("utils.deep-merge-tables")
local copy = require ("utils.shallow-copy")

return function (custom)
    return merger (custom, require ("configs.lsp.configs.defaults"))
end
