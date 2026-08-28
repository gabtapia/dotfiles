return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                                         ",
				"    ██████╗ ███╗   ██╗████████╗██╗   ██╗██╗███╗   ███╗   ",
				"   ██╔════╝ ████╗  ██║╚══██╔══╝██║   ██║██║████╗ ████║   ",
				"   ██║  ███╗██╔██╗ ██║   ██║   ██║   ██║██║██╔████╔██║   ",
				"   ██║   ██║██║╚██╗██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║   ",
				"   ╚██████╔╝██║ ╚████║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║   ",
				"    ╚═════╝ ╚═╝  ╚═══╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝   ",
				"                                                         ",
			}

			dashboard.section.buttons.val = {
				dashboard.button("n", "  Novo Arquivo", "<cmd>ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰈞  Buscar Arquivos (Telescope)", "<cmd>Telescope find_files<CR>"),
				dashboard.button("r", "󰄉  Arquivos Recentes", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("g", "󰱼  Buscar Palavra (Live Grep)", "<cmd>Telescope live_grep<CR>"),
				dashboard.button("l", "󰒲  Plugins (Lazy)", "<cmd>Lazy<CR>"),
				dashboard.button("q", "󰅚  Sair do Neovim", "<cmd>qa<CR>"),
			}

			dashboard.section.footer.val = ""

			-- 'Function' ou 'Type' vão puxar a cor azul do seu tema do Neovim
			dashboard.section.header.opts.hl = "Function"
			dashboard.section.buttons.opts.hl = "Keyword"
			dashboard.section.footer.opts.hl = "String"

			alpha.setup(dashboard.opts)
		end,
	},
}
