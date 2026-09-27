return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configuração dos diagnósticos (evita textos cortados e formata a caixa flutuante)
			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
					prefix = "●",
				},
				float = {
					border = "rounded",
					focusable = true,
					wrap = true, -- Quebra linhas compridas
					max_width = 80, -- Limite de largura para não vazar da tela
				},
				severity_sort = true,
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "lua_ls", "pyright", "vtsls", "html", "cssls", "emmet_ls" },
				handlers = {
					function(server_name)
						local opts = {
							capabilities = capabilities,
						}

						if server_name == "lua_ls" then
							opts.settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
									workspace = {
										library = {
											vim.env.VIMRUNTIME,
											"${3rd}/luv/library",
										},
										checkThirdParty = false,
									},
									telemetry = { enable = false },
								},
							}
						end

						if server_name == "pyright" then
							opts.settings = {
								python = {
									analysis = {
										autoSearchPaths = true,
										useLibraryCodeForTypes = true,
										diagnosticMode = "workspace",
									},
								},
							}
						end

						require("lspconfig")[server_name].setup(opts)
					end,
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>lr", ":lsp restart<CR>", { desc = "Restart LSP", silent = true })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Abrir popup de diagnóstico" })
		end,
	},
}
