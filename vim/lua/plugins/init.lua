return {
  "tpope/vim-unimpaired", -- Additional ][ mappings

  "AndrewRadev/switch.vim",
  "APZelos/blamer.nvim",
  "raimon49/requirements.txt.vim",
  "p00f/nvim-ts-rainbow", -- Rainbow braces
  { "mhinz/vim-sayonara" }, -- Smart logic to close buffers

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

  -- { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp" } }, -- Autocompletion
  -- "hrsh7th/cmp-buffer",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-git",
  -- "hrsh7th/cmp-nvim-lsp-signature-help",
  -- "andersevenrud/cmp-tmux",
  -- "onsails/lspkind.nvim",

  -- {
  -- 	"kdheepak/tabline.nvim",
  -- 	config = function()
  -- 		require("tabline").setup({
  -- 			-- Defaults configuration options
  -- 			enable = true,
  -- 			options = {
  -- 				-- If lualine is installed tabline will use separators configured in lualine by default.
  -- 				-- These options can be used to override those settings.
  -- 				section_separators = { "", "" },
  -- 				component_separators = { "", "" },
  -- 				max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
  -- 				show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
  -- 				show_devicons = true, -- this shows devicons in buffer section
  -- 				show_bufnr = false, -- this appends [bufnr] to buffer section,
  -- 				show_filename_only = false, -- shows base filename only instead of relative path in filename
  -- 				modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
  -- 				show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
  -- 			},
  -- 		})
  -- 		vim.cmd([[
  --        set guioptions-=e " Use showtabline in gui vim
  --        set sessionoptions+=tabpages,globals " store tabpages and globals in session
  --      ]])
  -- 	end,
  -- 	dependencies = { { "nvim-lualine/lualine.nvim", opt = true }, { "nvim-tree/nvim-web-devicons", opt = true } },
  -- },

  -- "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
  -- { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy Finder (files, lsp, etc)
  -- "rking/ag.vim", -- Search for thing
  -- "SmiteshP/nvim-navic",
  -- dependencies = "neovim/nvim-lspconfig", -- Show code context
  -- "ethanholz/nvim-lastplace",

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
  -- {
  -- 	"AckslD/nvim-trevJ.lua",
  -- 	config = 'require("trevj").setup()', -- optional call for configurating non-default filetypes etc

  -- 	-- uncomment if you want to lazy load
  -- 	-- module = 'trevj',

  -- 	-- an example for configuring a keybind, can also be done by filetype
  -- 	setup = function()
  -- 		vim.keymap.set("n", "<leader>J", function()
  -- 			require("trevj").format_at_cursor()
  -- 		end)
  -- 	end,
  -- },

  -- "justinmk/vim-dirvish", -- Better directory navigation
  -- "azabiong/vim-highlighter", -- Highlight specific words

  -- "ixru/nvim-markdown",

}
