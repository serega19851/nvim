-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },

		-- Auto-Install LSPs, linters, formatters, debuggers
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim" },
	},
	config = function()
		-- Initialize Mason before everything else
		require("mason").setup()

		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Полностью блокируем автоматическую настройку pyright
		lspconfig.pyright.setup = function() 
			-- Блокируем автоматическую настройку, будем настраивать вручную
		end

		-- Basic LSP setup
		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		-- Default config for all LSP servers
    local default_config = {
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
      handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      }
    }

    -- Единые настройки для всех диагностик
    vim.diagnostic.config({
      underline = false,
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      float = { border = "rounded" }
    })

		-- Setup Mason-LSPConfig
		mason_lspconfig.setup({
			-- Install these LSPs automatically
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"gradle_ls",
				--'groovyls',
				"lua_ls",
				"jsonls",
				"lemminx",
				"marksman",
				"quick_lint_js",
				"yamlls",
				"pyright",
			},
		})

		-- Setup Mason-Tool-Installer
		require("mason-tool-installer").setup({
			-- Install these linters, formatters, debuggers automatically
			ensure_installed = {
				"black",
				"debugpy",
				"flake8",
				"isort",
				"mypy",
				"pylint",
			},
		})

		-- There is an issue with mason-tools-installer running with VeryLazy
		vim.api.nvim_command("MasonToolsInstall")

		-- Setup LSP servers
		local setup_server = function(server_name)
			local config = vim.deepcopy(default_config)

			-- Special configuration for specific servers
			if server_name == "lua_ls" then
				config.settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
					},
				}
			end

			lspconfig[server_name].setup(config)
		end

		-- Get list of installed servers and set them up
		local installed_servers = mason_lspconfig.get_installed_servers()
		
		for _, server in ipairs(installed_servers) do
			setup_server(server)
		end
	end,
}
