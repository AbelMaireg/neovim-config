return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    config = function ()
      require ("barbecue").setup ()

      require ("nvim-navic").setup ({
        lsp = {
          auto_attach = true,
          preference = { "volar", "ts_ls" },
        },
      })
    end,
  },
}
