return {
	"brianhuster/live-preview.nvim",
	opts = {
		port = 5500,
	},
	config = function()
		-- Atalho: <leader>lp para abrir o preview ao vivo no navegador
		vim.keymap.set("n", "<leader>lp", ":LivePreview start<CR>", { desc = "Iniciar Live Preview", silent = true })
		vim.keymap.set("n", "<leader>lP", ":LivePreview close<CR>", { desc = "Fechar Live Preview", silent = true })
	end,
}
