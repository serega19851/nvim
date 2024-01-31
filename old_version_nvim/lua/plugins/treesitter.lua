require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "typescript", "lua", "go", "tsx", "javascript" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
