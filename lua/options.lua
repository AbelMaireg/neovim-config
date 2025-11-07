local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local o = vim.o
local g = vim.g

-- options
o.laststatus = 3
o.showmode = false

o.clipboard = ""
o.cursorline = true
o.cursorlineopt = "both"
o.scrolloff = 10
vim.lsp.inlay_hint.enable (true)

-- folds
o.foldmethod = "indent"
o.foldenable = true
o.foldlevel = 99
o.foldnestmax = 10
o.foldlevelstart = 99

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = true

-- disable nvim intro
opt.shortmess:append ("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

o.swapfile = false
o.backup = false
o.writebackup = false
o.updatetime = 250

opt.whichwrap:append ("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.copilot_no_tab_map = true

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has ("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat ({ vim.fn.stdpath ("data"), "mason", "bin" }, sep)
    .. delim
    .. vim.env.PATH

-- highlight on yank
autocmd ("TextYankPost", {
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank ({
            higroup = "IncSearch",
            timeout = 200,
            on_visual = true,
        })
    end,
})

-- open nvim-tree if directory is opened
autocmd ("VimEnter", {
    callback = function ()
        if vim.fn.argc () ~= 1 then
            require ("telescope.builtin").find_files ()
        end
    end,
})

-- apply settings from editorconfig, and trigger FileType autocommands
autocmd ({ "UIEnter", "BufReadPost", "BufNewFile" }, {
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

-- format on save
autocmd ("BufWritePre", {
    pattern = "*",
    callback = function (args)
        require ("conform").format ({ bufnr = args.buf })
    end,
})

-- filetype specific settings
local settings = require ("file-type-settings")
for ft, opts in pairs (settings) do
    autocmd ("FileType", {
        pattern = { ft },
        callback = function ()
            vim.bo.tabstop = opts.indent.tabstop or 4
            vim.bo.shiftwidth = opts.indent.shiftwidth or 4
            vim.bo.softtabstop = opts.indent.softtabstop or 4
            vim.bo.expandtab = opts.indent.expandtab or true
        end,
    })
end

-- config for telescope previewer
autocmd ("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function (args)
        vim.wo.number = true
    end,
})

-- diagnostic config
vim.diagnostic.config ({
    virtual_text = {
        prefix = "●",
        spacing = 4,
        source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})
