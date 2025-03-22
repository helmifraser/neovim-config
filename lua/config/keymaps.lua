-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

if Util.has("bufferline.nvim") then
  -- map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  -- map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  -- map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  -- map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

map("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Toggle harpoon menu" })
map("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Navigate to next mark" })
map("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Navigate to prev mark" })
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon a file" })

local opts = { buffer = 0 }
map("t", "<esc>", [[<C-\><C-n>]], opts)
map("t", "jk", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

-- vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
-- vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
-- vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
-- vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Set mapping for searching a session.
vim.keymap.set("n", "<leader>z", require("auto-session.session-lens").search_session, {
  desc = "Search session",
  noremap = true,
})

local wk = require("which-key")
local scretch = require("scretch")
wk.register({
  ["<leader>n"] = { name = "+scratch files" },
  ["<leader>nn"] = { scretch.new, "New scratch file" },
  ["<leader>nnn"] = { scretch.new_named, "New named scratch file" },
  ["<leader>nl"] = { scretch.last, "Last scratch file" },
  ["<leader>ns"] = { scretch.search, "Search scratch files" },
  ["<leader>ng"] = { scretch.grep, "Grep scratch files" },
  ["<leader>nv"] = { scretch.explore, "Explore scratch files" },
})

local blame = require("blame")
wk.register({
  ["<leader>gb"] = { "<cmd>ToggleBlame<cr>", "Toggle git blame" },
})
--
-- vim.keymap.set("n", "<leader>nn", scretch.new, { desc = "New scretch" })
-- vim.keymap.set("n", "<leader>nnn", scretch.new_named, { desc = "New named scretch" })
-- vim.keymap.set("n", "<leader>nl", scretch.last, { desc = "Last scretch" })
-- vim.keymap.set("n", "<leader>ns", scretch.search, { desc = "Search scretch" })
-- vim.keymap.set("n", "<leader>ng", scretch.grep, { desc = "Grep scretch" })
-- vim.keymap.set("n", "<leader>nv", scretch.explore, { desc = "Explore scretch" })
--

-- -- map("n", "<CR>", "ciw", { desc = "Change in word" })
-- vim.keymap.set("v", "<leader>]", ":Gen<CR>")
-- vim.keymap.set("n", "<leader>]", ":Gen<CR>")

-- undotree toggle
vim.keymap.set("n", "<leader>cu", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })

local function wrapTryExceptBreakpoint()
  -- Get the current buffer
  local bufnr = vim.api.nvim_get_current_buf()
  -- Get the start and end of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Extract start and end line numbers, adjusting for zero indexing
  local start_line = start_pos[2] - 1
  local end_line = end_pos[2] - 1

  -- Ensure start_line <= end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Get the lines in the selection
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)

  -- Prepare the try/except block with the selected lines
  local wrappedLines = {
    "try:",
    unpack(lines),
    "except Exception as e:",
    "    breakpoint()  # Or `import pdb; pdb.set_trace()` for older versions of Python",
    '    print(f"Error: {e}")',
  }

  -- Replace the selected lines with the new block
  vim.api.nvim_buf_set_lines(bufnr, start_line, end_line + 1, false, wrappedLines)
end

map("v", "<leader>cb", wrapTryExceptBreakpoint, { desc = "Wrap in try/except with breakpoint" })

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
