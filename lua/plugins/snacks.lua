return {
  {
    "folke/snacks.nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = false },
      dashboard = {
        enabled = true,
        preset = {
          header = [[AbelMaireg]],
        },
      },
      explorer = { enabled = false },
      gitbrowse = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = {
        enabled = true,
        keys = {
          jump = {
            ["zk"] = {
              min_size = 1,
              bottom = false,
              cursor = false,
              edge = true,
              treesitter = { blocks = { enabled = true } },
              desc = "jump to top edge of scope",
            },
            ["zj"] = {
              min_size = 1,
              bottom = true,
              cursor = false,
              edge = true,
              treesitter = { blocks = { enabled = true } },
              desc = "jump to bottom edge of scope",
            },
          },
        },
        blocks = {
          enabled = true,
          "function_declaration",
          "function_definition",
          "method_declaration",
          "method_definition",
          "class_declaration",
          "class_definition",
          "do_statement",
          "while_statement",
          "repeat_statement",
          "if_statement",
          "for_statement",
        },
      },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
