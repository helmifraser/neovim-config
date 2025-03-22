return {
  {
    "rebelot/kanagawa.nvim",
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },

  -- -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "diegoulloao/neofusion.nvim", priority = 1000, config = true, opts = ... },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.opt.background = "dark"
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "soft"
      vim.g.everforest_better_performance = 1
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
      -- colorscheme = "kanagawa",
      -- colorscheme = "kanagawa-lotus",
      -- colorscheme = "kanagawa-dragon",
    },
  },
}
