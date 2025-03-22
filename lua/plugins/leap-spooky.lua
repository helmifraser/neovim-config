return {
  {
    "ggandor/leap-spooky.nvim",
    opts = {
      affixes = {
        -- These will generate mappings for all native text objects, like:
        -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
        -- Special line objects will also be added, by repeating the affixes.
        -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
        -- window.
        -- You can also use 'rest' & 'move' as mnemonics.
        remote = { window = "r", cross_window = "R" },
        magnetic = { window = "m", cross_window = "M" },
      },
      -- If this option is set to true, the yanked text will automatically be pasted
      -- at the cursor position if the unnamed register is in use.
      paste_on_remote_yank = false,
    },
  },
}

-- require("leap-spooky").setup({
--   affixes = {
--     -- These will generate mappings for all native text objects, like:
--     -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
--     -- Special line objects will also be added, by repeating the affixes.
--     -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
--     -- window.
--     -- You can also use 'rest' & 'move' as mnemonics.
--     remote = { window = "r", cross_window = "R" },
--     magnetic = { window = "m", cross_window = "M" },
--   },
--   -- If this option is set to true, the yanked text will automatically be pasted
--   -- at the cursor position if the unnamed register is in use.
--   paste_on_remote_yank = false,
--   opts = {},
-- })
--
-- {
--   "ggandor/leap.nvim",
--   keys = {
--     { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
--     { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
--     { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
--   },
--   config = function(_, opts)
--     local leap = require("leap")
--     for k, v in pairs(opts) do
--       leap.opts[k] = v
--     end
--     leap.add_default_mappings(true)
--     vim.keymap.del({ "x", "o" }, "x")
--     vim.keymap.del({ "x", "o" }, "X")
--   end,
-- }
