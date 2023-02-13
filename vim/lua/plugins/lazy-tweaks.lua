return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
		end,
		opts = function(_, opts)
			opts = {
				show_trailing_blankline_indent = false,
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
					"IndentBlanklineIndent3",
					"IndentBlanklineIndent4",
					"IndentBlanklineIndent5",
					"IndentBlanklineIndent6",
				},
			}
		end,
	},

	{
		"echasnovski/mini.ai",
		opts = {
			custom_textobjects = {
				L = function(ai_type)
					local line_num = vim.fn.line(".")
					local line = vim.fn.getline(line_num)
					-- Select `\n` past the line for `a` to delete it whole
					local from_col, to_col = 1, line:len() + 1
					if ai_type == "i" then
						if line:len() == 0 then
							-- Don't remove empty line
							from_col, to_col = 0, 0
						else
							-- Ignore indentation for `i` textobject and don't remove `\n` past the line
							from_col = line:match("^%s*()")
							to_col = line:len()
						end
					end

					return { from = { line = line_num, col = from_col }, to = { line = line_num, col = to_col } }
				end,
				e = function(ai_type)
					local n_lines = vim.fn.line("$")
					local start_line, end_line = 1, n_lines
					if ai_type == "i" then
						-- Skip first and last blank lines for `i` textobject
						local first_nonblank, last_nonblank = vim.fn.nextnonblank(1), vim.fn.prevnonblank(n_lines)
						start_line = first_nonblank == 0 and 1 or first_nonblank
						end_line = last_nonblank == 0 and n_lines or last_nonblank
					end

					local to_col = math.max(vim.fn.getline(end_line):len(), 1)
					return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
				end,
			},
		},
	},

	-- Disabled plugins
	{ "kylechui/nvim-surround", enabled = false },
	{ "ggandor/leap.nvim", enabled = false },
	{ "ggandor/flit.nvim", enabled = false },
}
