return {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
        pre_hook = function (ctx)
            local commentstring = {
                php = "// %s",
            }

            if commentstring[vim.bo.filetype] then
                return commentstring[vim.bo.filetype]
            end

            return nil
        end,
    },
}
