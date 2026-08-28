return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	config = function()
		require("venv-selector").setup()
	end,
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Selecionar Venv Python" },
	},
}
