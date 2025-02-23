-- require("nvchad.options")

local api = vim.api
local opt = vim.opt
local create_autocmd = vim.api.nvim_create_autocmd

-- NVCHAD --
local o = vim.o
local g = vim.g

-- options
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append ("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append ("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has ("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat ({ vim.fn.stdpath ("data"), "mason", "bin" }, sep)
    .. delim
    .. vim.env.PATH

-- CUSTOM --

-- visuals
opt.cursorline = true
opt.cursorlineopt = "both"
api.nvim_set_hl (0, "CursorLine", { bg = "#202020" })
api.nvim_set_hl (0, "Visual", { bg = "#505050", underline = true })
api.nvim_set_hl (0, "LspReferenceRead", { ctermbg = "LightYellow" })
api.nvim_set_hl (0, "LspReferenceText", { ctermbg = "LightBlue" })
api.nvim_set_hl (0, "LspReferenceWrite", { ctermbg = "LightGreen" })
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

vim.lsp.inlay_hint.enable (true)
require ("barbecue.ui").toggle (true)

create_autocmd ("TextYankPost", {
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank ({
            higroup = "IncSearch",
            timeout = 200,
            on_visual = true,
        })
    end,
})

create_autocmd ("VimEnter", {
    callback = function ()
        if
            vim.fn.argc () == 1
            and vim.fn.isdirectory (vim.fn.argv (0)) == 1
        then
            require ("nvim-tree.api").tree.open ()
        end
    end,
})

local default_hover = vim.lsp.handlers["textDocument/hover"]

vim.lsp.handlers["textDocument/hover"] = function (err, result, ctx, config)
    if result and result.contents then
        default_hover (err, result, ctx, config) -- Call the original LSP hover handler
    end
end

create_autocmd ({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup ("NvFilePost", { clear = true }),
    callback = function (args)
        local file = vim.api.nvim_buf_get_name (args.buf)
        local buftype =
            vim.api.nvim_get_option_value ("buftype", { buf = args.buf })

        if not vim.g.ui_entered and args.event == "UIEnter" then
            vim.g.ui_entered = true
        end

        if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
            vim.api.nvim_exec_autocmds (
                "User",
                { pattern = "FilePost", modeline = false }
            )
            vim.api.nvim_del_augroup_by_name ("NvFilePost")

            vim.schedule (function ()
                vim.api.nvim_exec_autocmds ("FileType", {})

                if vim.g.editorconfig then
                    require ("editorconfig").config (args.buf)
                end
            end)
        end
    end,
})
