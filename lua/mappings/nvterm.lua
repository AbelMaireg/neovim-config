local map = vim.keymap.set

for _, mapping in ipairs({
    { "<A-h>", "horizontal" },
    { "<A-v>", "vertical" },
    { "<A-i>", "float" },
}) do
    map({ "n", "t" }, mapping[1], function()
        require("nvterm.terminal").toggle(mapping[2])
    end, { desc = "terminal" .. mapping[2] })
end

map("n", "<Leader>rt", function()
    require("nvterm.terminal").send("yarn test", "vertical")
end, { desc = "run test" })