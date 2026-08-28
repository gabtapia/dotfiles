return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"javascript",
			"java",
			"python",
			"markdown",
			"json",
			"yaml",
			"html",
			"css",
			"sql",
			"bash",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
	end,
}
