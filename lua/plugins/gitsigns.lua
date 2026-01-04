return {
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = function ()
            dofile (vim.g.base46_cache .. "git")

            return {
                signs = {
                    delete = { text = "󰍵" },
                    changedelete = { text = "󱕖" },
                },
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000, -- Delay in milliseconds before blame shows
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
            }
        end,
    },
}
