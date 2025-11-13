local map = vim.keymap.set

local opening_maps = {
    { "<A-h>", "horizontal" },
    { "<A-v>", "vertical" },
    { "<A-i>", "float" },
}

for _, mapping in ipairs (opening_maps) do
    map ({ "n", "t" }, mapping[1], function ()
        require ("nvterm.terminal").toggle (mapping[2])
    end, { desc = "terminal" .. mapping[2] })
end

map ({ "t", "n" }, "<Esc>", "<C-\\><C-n>", { desc = "Normal Mode" })
map ({ "t", "n" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
map ({ "t", "n" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
map ({ "t", "n" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
map ({ "t", "n" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })
