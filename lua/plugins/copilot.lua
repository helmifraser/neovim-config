return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          -- accept = "<M-l>",
          accept = "<M-;>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<C-w>p",
        },
        layout = {
          position = "right", -- | top | left | right | bottom
          ratio = 0.4,
        },
      },
      filetypes = {
        ["dap-repl"] = false,
      },
    },
  },
  -- {
  --   "david-kunz/gen.nvim",
  --   config = function()
  --     require("gen").model = "phind-codellama:34b-v2"
  --   end,
  -- },
  -- {
  --   "David-Kunz/gen.nvim",
  --   config = function()
  --     vim.keymap.set("v", "<leader>]", ":Gen<CR>")
  --     vim.keymap.set("n", "<leader>]", ":Gen<CR>")
  --     require("gen").model = "phind-codellama:34b-v2"
  --     require("gen").prompts["Optimise this"] = {
  --       prompt = "You are a senior artificial intelligence and algorithms engineer, acting as an assistant. You offer help with algorithm development, research and code optimisation. You answer with code examples when possible. Given this input, optimise it and make it more efficient: \n$text",
  --     }
  --   end,
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  --     debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  --     disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
  --     language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
  --     -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
  --     -- temperature = 0.1,
  --   },
  --   build = function()
  --     vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  --   end,
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
  --     { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
  --     { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
  --     {
  --       "<leader>ccT",
  --       "<cmd>CopilotChatVsplitToggle<cr>",
  --       desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
  --     },
  --     {
  --       "<leader>ccv",
  --       ":CopilotChatVisual ",
  --       mode = "x",
  --       desc = "CopilotChat - Open in vertical split",
  --     },
  --     {
  --       "<leader>ccx",
  --       ":CopilotChatInPlace<cr>",
  --       mode = "x",
  --       desc = "CopilotChat - Run in-place code",
  --     },
  --     {
  --       "<leader>ccf",
  --       "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
  --       desc = "CopilotChat - Fix diagnostic",
  --     },
  --     {
  --       "<leader>ccr",
  --       "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
  --       desc = "CopilotChat - Reset chat history and clear buffer",
  --     },
  --   },
  -- },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
    },
    config = true,
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        agent = {
          adapter = "copilot",
        },
      },
    },
  },
}

--   panel = {
--     enabled = true,
--     auto_refresh = false,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<M-CR>",
--     },
--     layout = {
--       position = "bottom", -- | top | left | right
--       ratio = 0.4,
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = false,
--     debounce = 75,
--     keymap = {
--       accept = "<M-l>",
--       accept_word = false,
--       accept_line = false,
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     yaml = false,
--     markdown = false,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
--   copilot_node_command = "node", -- Node.js version must be > 16.x
--   server_opts_overrides = {},
-- }

-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   opts = {
--     suggestion = { enabled = false },
--     panel = {
--       enabled = true,
--       auto_refresh = true,
--       layout = {
--         position = "right", -- | top | left | right | bottom
--         ratio = 0.4,
--       },
--     },
--   },
-- }
