return function()
    local clients = vim.lsp.get_clients()
    local supports_document_highlight = false

    for _, client in ipairs(clients) do
        if client.server_capabilities.documentHighlightProvider then
            supports_document_highlight = true
            break
        end
    end

    if supports_document_highlight then
        vim.lsp.buf.document_highlight()
    end
end