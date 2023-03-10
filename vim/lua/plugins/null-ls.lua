return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.code_actions.refactoring,
					nls.builtins.code_actions.shellcheck,
					nls.builtins.diagnostics.codespell.with({
						command = "codespell-nvim",
						arg = { "-" },
					}),

					nls.builtins.diagnostics.jsonlint,
					nls.builtins.diagnostics.flake8.with({
						extra_args = { "--max-line-length", "99" },
					}),
					nls.builtins.formatting.jq,
					nls.builtins.formatting.prettier,
					nls.builtins.formatting.black,
				},
			}
		end,
	},
}
