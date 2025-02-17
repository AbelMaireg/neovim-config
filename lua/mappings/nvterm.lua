local map = vim.keymap.set

for _, mapping in ipairs ({
  { "<A-h>", "horizontal" },
  { "<A-v>", "vertical" },
  { "<A-i>", "float" },
}) do
  map ({ "n", "t" }, mapping[1], function ()
    require ("nvterm.terminal").toggle (mapping[2])
  end, { desc = "terminal" .. mapping[2] })
end

map ("n", "<Leader>rt", function ()
  require ("nvterm.terminal").send ("yarn test", "vertical")
end, { desc = "run test" })

map (
  "t",
  "<C-j>",
  "<C-\\><C-N><C-j>",
  { desc = "terminal escape terminal mode" }
)
map (
  "t",
  "<C-k>",
  "<C-\\><C-N><C-k>",
  { desc = "terminal escape terminal mode" }
)
map (
  "t",
  "<C-h>",
  "<C-\\><C-N><C-h>",
  { desc = "terminal escape terminal mode" }
)
map (
  "t",
  "<C-l>",
  "<C-\\><C-N><C-l>",
  { desc = "terminal escape terminal mode" }
)
