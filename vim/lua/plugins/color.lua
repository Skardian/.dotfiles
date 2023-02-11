return {
	{
		"themercorp/themer.lua", -- Multiple themes, including jellybeans
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Custom colors for hlsearch
			vim.cmd([[highlight Search guifg=#43dede guibg=black]])
			vim.cmd([[highlight Search gui=underline guifg=#00dddd guibg=#302028]])
			vim.cmd([[highlight FoldColumn guifg=#535D66 guibg=#1f1f1f]])

			-- Custom color for CmpItemMenu
			vim.cmd([[highlight CmpItemMenu guifg=#fabada]])

			-- Load customized colorscheme
			vim.cmd([[colorscheme themer_jellybeans]])
		end,
	},
}
