return function (client, bufnr)
    require ("mappings.vim-lsp")
    require ("nvim-navbuddy").attach (client, bufnr)
end
