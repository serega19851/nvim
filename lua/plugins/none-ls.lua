return {
	-- https://github.com/nvimtools/none-ls.nvim
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.lua_format,
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.black,
				-- null_ls.builtins.formatting.reorder_python_imports,
				-- null_ls.builtins.formatting.isort,
				-- null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"txt",
						"css",
						"scss",
						"less",
						"html",
						-- "json",
						"jsonc",
						"yaml",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
				}),
				 -- null_ls.builtins.formatting.eslint_d.with({
				 -- filetypes = {
				 -- "typescript",
				 -- "javascript",
				 -- "typescriptreact",
				 -- "javascriptreact",
				 -- },
				 -- }),
				 -- null_ls.builtins.diagnostics.eslint_d,
				-- null_ls.builtins.diagnostics.ltrs,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
