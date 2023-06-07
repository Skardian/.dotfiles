return {
  "tpope/vim-unimpaired", -- Additional ][ mappings

  "AndrewRadev/switch.vim",
  {
    "APZelos/blamer.nvim",
    config = function()
      vim.g.blamer_relative_time = 1
      vim.g.blamer_delay = 500
      vim.g.blamer_enabled = 1
    end
  },
  "raimon49/requirements.txt.vim",
  "p00f/nvim-ts-rainbow", -- Rainbow braces
  "mhinz/vim-sayonara" , -- Smart logic to close buffers
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g.terraform_fmt_on_save = true
      require 'lspconfig'.tflint.setup {}
    end,
  },
  "juliosueiras/vim-terraform-completion",

  "mong8se/actually.nvim", -- Open files with partial names

  "christoomey/vim-sort-motion", -- gs to sort things

  "stsewd/isort.nvim", -- Python import sort

  "NvChad/nvim-colorizer.lua", -- Highlight colors
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    setup = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy Finder (files, lsp, etc)
  -- "rking/ag.vim", -- Search for thing
  -- "vim-scripts/matchit.zip", -- Better % matching

  -- "junegunn/vim-easy-align", -- Align code
  -- "junegunn/vim-peekaboo", -- Show regs
  -- {
  -- 	"windwp/nvim-autopairs",
  -- 	config = function()
  -- 		require("nvim-autopairs").setup({})
  -- 	end,
  -- },

  -- -- Programming languages

  -- "tommcdo/vim-exchange",
  -- "kevinhwang91/nvim-bqf",

  -- "stevearc/dressing.nvim",

{
	"AckslD/nvim-trevJ.lua",
	config = 'require("trevj").setup()', -- optional call for configurating non-default filetypes etc

	-- uncomment if you want to lazy load
	-- module = 'trevj',

	-- an example for configuring a keybind, can also be done by filetype
	setup = function()
		vim.keymap.set("n", "<leader>J", function()
			require("trevj").format_at_cursor()
		end)
	end,
},

  -- "justinmk/vim-dirvish", -- Better directory navigation
  -- "azabiong/vim-highlighter", -- Highlight specific words

  -- "ixru/nvim-markdown",

}
