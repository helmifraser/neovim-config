return {
  {

    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = function(_, opts)
        -- opts.window.position = "left"
        opts.window.position = "right"
      end,
    },
    -- {
    --   "neovim/nvim-lspconfig",
    --   ---@class PluginLspOpts
    --   opts = {
    --     autoformat = false,
    --     ---@type lspconfig.options
    --     servers = {
    --       -- pyright will be automatically installed with mason and loaded with lspconfig
    --       pyright = {
    --         settings = {
    --           python = {
    --             -- pythonPath = "/Users/helmi/miniforge3/envs/poddie-3810/bin/python",
    --           },
    --         },
    --       },
    --     },
    --   },
    -- },

    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",
          "flake8",
          "black",
          "pyright",
        },
        automatic_installation = true,
      },
    },
    -- {
    --   "nvimtools/none-ls.nvim",
    --   opts = function(_, opts)
    --     local nls = require("null-ls")
    --     opts.sources = vim.list_extend(opts.sources or {}, {
    --       nls.builtins.formatting.fish_indent,
    --       nls.builtins.diagnostics.fish,
    --       nls.builtins.formatting.stylua,
    --       nls.builtins.formatting.shfmt,
    --       -- nls.builtins.diagnostics.flake8,
    --       nls.builtins.formatting.black,
    --       -- require("python.extensions.null-ls.code-actions"),
    --     })
    --     vim.lsp.buf.format({ timeout_ms = 2000 })
    --     return opts
    --   end,
    -- },

    {
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
          auto_session_enabled = true,
          auto_save_enabled = true,
          auto_restore_enabled = false,
        })
      end,
      session_lens = {
        theme_conf = { border = true },
        previewer = false,
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          },
        },
      },
    },
    {
      "mbbill/undotree",
    },
    { "mrjones2014/smart-splits.nvim" },
    {
      "mikesmithgh/kitty-scrollback.nvim",
      enabled = true,
      lazy = true,
      cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
      event = { "User KittyScrollbackLaunch" },
      -- version = '*', -- latest stable version, may have breaking changes if major version changed
      -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
      config = function()
        require("kitty-scrollback").setup()
      end,
    },
    {
      "chrisgrieser/nvim-rip-substitute",
      keys = {
        {
          "<leader>fs",
          function()
            require("rip-substitute").sub()
          end,
          mode = { "n", "x" },
          desc = " rip substitute",
        },
      },
    },
    {
      "epwalsh/obsidian.nvim",
      version = "*", -- recommended, use latest release instead of latest commit
      lazy = true,
      ft = "markdown",
      -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
      -- event = {
      --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      --   -- refer to `:h file-pattern` for more examples
      --   "BufReadPre path/to/my-vault/*.md",
      --   "BufNewFile path/to/my-vault/*.md",
      -- },
      dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
      },
      opts = {
        workspaces = {
          {
            name = "personal",
            path = "/Users/helmi/Documents/obsidian_vault/personal/",
          },
        },
        daily_notes = {
          folder = "Daily notes",
        },

        -- see below for full list of options 👇
      },
    },
    -- bug: cannot navigate within nvim splits using ctrl + hjkl
    -- {
    --   "knubie/vim-kitty-navigator",
    -- },

    -- {
    --   "rmagatti/session-lens",
    -- },

    --   {
    --     "leap-spooky",
    --     affixes = {
    --       -- These will generate mappings for all native text objects, like:
    --       -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
    --       -- Special line objects will also be added, by repeating the affixes.
    --       -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
    --       -- window.
    --       -- You can also use 'rest' & 'move' as mnemonics.
    --       remote = { window = "r", cross_window = "R" },
    --       magnetic = { window = "m", cross_window = "M" },
    --     },
    --     -- If this option is set to true, the yanked text will automatically be pasted
    --     -- at the cursor position if the unnamed register is in use.
    --     paste_on_remote_yank = false,
    --     opts = {},
    --   },
  },

  -- mini surround setup, not needed
  -- just an example of how to change keybindings
  -- remeber if you want to change them, you'll need to change Leap's keybindings too
  -- No need to copy this inside `setup()`. Will be used automatically.
  -- {
  --   -- Add custom surroundings to be used on top of builtin ones. For more
  --   -- information with examples, see `:h MiniSurround.config`.
  --   custom_surroundings = nil,
  --
  --   -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  --   highlight_duration = 500,
  --
  --   -- Module mappings. Use `''` (empty string) to disable one.
  --   mappings = {
  --     add = "sa", -- Add surrounding in Normal and Visual modes
  --     delete = "sd", -- Delete surrounding
  --     find = "sf", -- Find surrounding (to the right)
  --     find_left = "sF", -- Find surrounding (to the left)
  --     highlight = "sh", -- Highlight surrounding
  --     replace = "sr", -- Replace surrounding
  --     update_n_lines = "sn", -- Update `n_lines`
  --
  --     suffix_last = "l", -- Suffix to search with "prev" method
  --     suffix_next = "n", -- Suffix to search with "next" method
  --   },
  --
  --   -- Number of lines within which surrounding is searched
  --   n_lines = 20,
  --
  --   -- Whether to respect selection type:
  --   -- - Place surroundings on separate lines in linewise mode.
  --   -- - Place surroundings on each line in blockwise mode.
  --   respect_selection_type = false,
  --
  --   -- How to search for surrounding (first inside current line, then inside
  --   -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  --   -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
  --   -- see `:h MiniSurround.config`.
  --   search_method = "cover",
  -- },
}
