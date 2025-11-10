-- ~/.config/nvim/lua/configs/lsp/vue_ls.lua
return {
    on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
            local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })
            if #ts_clients == 0 then
                vim.notify('[vue_ls] No ts_ls client found for this buffer.', vim.log.levels.WARN)
                return
            end

            local ts_client = ts_clients[1]
            local param = unpack(result)
            local id, command, payload = unpack(param)

            ts_client:exec_cmd({
                title = 'vue_request_forward',
                command = 'typescript.tsserverRequest',
                arguments = { command, payload },
            }, { bufnr = context.bufnr }, function(_, r)
                local response = r and r.body
                local response_data = { { id, response } }
                client:notify('tsserver/response', response_data)
            end)
        end
    end,
}
