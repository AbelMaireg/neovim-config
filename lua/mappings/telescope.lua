local telescope_builtin = require ("telescope.builtin")
local map = vim.keymap.set

map (
    "n",
    "<Leader>gb",
    telescope_builtin.git_branches,
    { desc = "git branches" }
)

map ("n", "<Leader>gc", telescope_builtin.git_commits, { desc = "git commits" })

map ("n", "<Leader>gf", telescope_builtin.git_files, { desc = "git files" })

map ("n", "<Leader>gs", telescope_builtin.git_stash, { desc = "git stash" })

map ("n", "gL", telescope_builtin.diagnostics, { desc = "List diagnostics" })

map (
    "n",
    "<leader>fw",
    telescope_builtin.live_grep,
    { desc = "telescope live grep" }
)

map (
    "n",
    "<leader>fb",
    telescope_builtin.buffers,
    { desc = "telescope find buffers" }
)

map (
    "n",
    "<leader>fh",
    telescope_builtin.help_tags,
    { desc = "telescope help page" }
)

map (
    "n",
    "<leader>ma",
    telescope_builtin.marks,
    { desc = "telescope find marks" }
)

map (
    "n",
    "<leader>fo",
    telescope_builtin.oldfiles,
    { desc = "telescope find oldfiles" }
)

map (
    "n",
    "<leader>fz",
    telescope_builtin.current_buffer_fuzzy_find,
    { desc = "telescope find in current buffer" }
)

map (
    "n",
    "<leader>pt",
    "<cmd>Telescopr terms",
    { desc = "telescope pick hidden term" }
)

map (
    "n",
    "<leader>th",
    require ("nvchad.themes").open,
    { desc = "telescope nvchad themes" }
)

map (
    "n",
    "<leader>ff",
    telescope_builtin.find_files,
    { desc = "telescope find files" }
)

map (
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)
