local map = vim.keymap.set

map (
    "n",
    "<leader>tw",
    "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
    {}
)
