local map = vim.keymap.set

-- pane resizing
map (
    "n",
    "<A-Up>",
    ":resize +1<CR>",
    { desc = "Increase height", silent = true }
)
map (
    "n",
    "<A-Down>",
    ":resize -1<CR>",
    { desc = "Decrease height", silent = true }
)
map (
    "n",
    "<A-Left>",
    ":vertical resize -1<CR>",
    { desc = "Decrease width", silent = true }
)
map (
    "n",
    "<A-Right>",
    ":vertical resize +1<CR>",
    { desc = "Increase width", silent = true }
)

map ("i", "jk", "<ESC>")

-- alt-line motions
map ("n", "<A-k>", ":m .-2<CR>==", { desc = "move line up", silent = true })
map ("n", "<A-j>", ":m .+1<CR>==", { desc = "move line down", silent = true })
map (
    "v",
    "<A-k>",
    ":m '<-2<CR>gv=gv",
    { desc = "move selected line up", silent = true }
)
map (
    "v",
    "<A-j>",
    ":m '>+1<CR>gv=gv",
    { desc = "move selected line down", silent = true }
)

-- screen motions
map ("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map ("i", "<C-e>", "<End>", { desc = "move end of line" })
map ("i", "<C-h>", "<Left>", { desc = "move left" })
map ("i", "<C-l>", "<Right>", { desc = "move right" })
map ("i", "<C-j>", "<Down>", { desc = "move down" })
map ("i", "<C-k>", "<Up>", { desc = "move up" })

-- window switchs
map ("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map ("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map ("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map ("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
