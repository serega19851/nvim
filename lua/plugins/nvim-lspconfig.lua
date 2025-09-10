return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "pyright", "ruff" }
    })

  vim.diagnostic.config({
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    float = { border = "rounded" }
  })
    require("mason-tool-installer").setup({
      ensure_installed = { "debugpy" }
    })
    vim.api.nvim_command("MasonToolsInstall")
  end,
}
