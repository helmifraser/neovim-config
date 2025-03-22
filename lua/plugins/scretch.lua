return {
  {
    "Sonicfury/scretch.nvim",
    requires = "nvim-telescope/telescope.nvim",
    config = function()
      require("scretch").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
}
