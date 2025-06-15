return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --опционально
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- Это версия с регулярными выражениями, используйте её для новой версии плагина
    config = function()
      -- Настройка плагина с включённым отладочным режимом
      require("venv-selector").setup({
        debug = true,  -- Включение отладочного режима для использования логгера
      })
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
}
