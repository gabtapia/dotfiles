return {
	-- 1. Auto-close e auto-rename de tags HTML
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- 2. Highlight de cores em CSS/HTML
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	-- 3. Formatação moderna e inteligente (Substitui a dor de cabeça do none-ls)
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
