-- File Explorer / Tree
return {
	-- https://github.com/nvim-tree/nvim-tree.lua
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		-- https://github.com/nvim-tree/nvim-web-devicons
		"nvim-tree/nvim-web-devicons", -- Fancy icon support
	},
	opts = {
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
	filters = {
			custom = {'.pyc', '.pyo', '.pyd', '__pycache__'},  -- Скрываем .pyc, .pyo, .pyd файлы и __pycache__
		},
	},
	config = function(_, opts)
		-- Recommended settings to disable default netrw file explorer
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup(opts)
	end,
}
