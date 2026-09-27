return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true, -- Ativa o Git Blame inline estilo GitLens
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' (fim da linha), 'overlay' ou 'right_align'
			delay = 500, -- Tempo em ms com o cursor parado para exibir o blame
			ignore_whitespace = false,
		},
		current_line_blame_formatter = " <author>, <author_time:%R> • <summary>",
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			vim.keymap.set("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { buffer = bufnr, desc = "Ver Git Blame completo em popup" })

			-- Atalho útil para alternar a exibição do blame quando quiser
			vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, {
				buffer = bufnr,
				desc = "Alternar Git Blame inline",
			})

			-- Abre uma janela flutuante com os detalhes do commit da linha
			vim.keymap.set("n", "<leader>gp", gs.preview_hunk, {
				buffer = bufnr,
				desc = "Pré-visualizar alteração (diff)",
			})
		end,
	},
}
