if true then
  return {}
end

return {

  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      -- Refer to my configuration here https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/edgy.lua
      right = {
        {
          title = "CopilotChat.nvim", -- Title of the window
          ft = "copilot-chat", -- This is custom file type from CopilotChat.nvim
          size = { width = 0.4 }, -- Width of the window
        },
      },
    },
  },
}
-- require("gen").prompts["Optimise this"] = {
--   prompt = "You are a senior artificial intelligence and algorithms engineer, acting as an assistant. You offer help with algorithm development, research and code optimisation. You answer with code examples when possible. Given this input, optimise it and make it more efficient: $input: \n$text",
-- }
