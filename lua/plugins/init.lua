return {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require ("configs.lspconfig")
    end,
  },

  {
    "NvChad/nvterm",
    config = function ()
      require ("nvterm").setup ()
    end,
  },
}
