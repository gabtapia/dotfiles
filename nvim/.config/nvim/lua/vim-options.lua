vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.diagnostic.config({
	update_in_insert = true,

	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "■",
	},
	severity_sort = true,
	float = {
		border = "rounded",
	},
})

vim.cmd([[
  highlight DiagnosticVirtualTextError guifg=#db4b4b guibg=#2d202a gui=italic
  highlight DiagnosticVirtualTextWarn  guifg=#e0af68 guibg=#2e2a24 gui=italic
  highlight DiagnosticVirtualTextInfo  guifg=#0db9d7 guibg=#192b35 gui=italic
  highlight DiagnosticVirtualTextHint  guifg=#1abc9c guibg=#1a2b32 gui=italic
 ]])

vim.keymap.set({ "n", "v", "i" }, "<C-a>", "<Esc>ggVG", { desc = "Selecionar tudo" })
vim.keymap.set("v", "<leader>gl", function()
	require("telescope.builtin").git_bcommits_range()
end, { desc = "Histórico do bloco selecionado" })
