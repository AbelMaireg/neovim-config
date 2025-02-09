require("nvchad.options")

local api = vim.api
local opt = vim.opt
local create_autocmd = vim.api.nvim_create_autocmd

-- visuals
opt.cursorline = true
opt.cursorlineopt = "both"
api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
api.nvim_set_hl(0, "Visual", { bg = "#505050", underline = true })
api.nvim_set_hl(0, "LspReferenceRead", { ctermbg = "LightYellow" })
api.nvim_set_hl(0, "LspReferenceText", { ctermbg = "LightBlue" })
api.nvim_set_hl(0, "LspReferenceWrite", { ctermbg = "LightGreen" })
opt.scrolloff = 10
opt.relativenumber = true

opt.foldmethod = "indent"
opt.foldenable = true
opt.foldlevel = 99
opt.foldnestmax = 10
opt.foldlevelstart = 99

opt.clipboard = "unnamed"

opt.shiftwidth = 4

opt.swapfile = false
opt.backup = false
opt.writebackup = false

vim.lsp.inlay_hint.enable(true)
require("barbecue.ui").toggle(true)

create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
            on_visual = true,
        })
    end,
})

create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            require("nvim-tree.api").tree.open()
        end
    end,
})

create_autocmd({ "LspAttach" }, {
    callback = function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        for _, client in ipairs(clients) do
            if client.supports_method("textDocument/documentHighlight") then
                vim.api.nvim_create_augroup("lsp_document_highlight", {})
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = "lsp_document_highlight",
                    buffer = 0,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    group = "lsp_document_highlight",
                    buffer = 0,
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end
    end,
})