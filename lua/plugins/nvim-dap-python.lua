return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      require("dap.ext.vscode").load_launchjs(nil, {
        node = { "python", "debugpy" },
      })
    end,
  },
}
