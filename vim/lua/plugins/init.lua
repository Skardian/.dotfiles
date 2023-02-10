return {
  'wbthomason/packer.nvim', -- Package manager
  {
    'themercorp/themer.lua', -- Multiple themes, including jellybeans
    config = function()
      -- Custom colors for hlsearch
      vim.cmd [[highlight Search guifg=#43dede guibg=black]]
      vim.cmd [[highlight Search gui=underline guifg=#00dddd guibg=#302028]]
      vim.cmd [[highlight FoldColumn guifg=#535D66 guibg=#1f1f1f]]

      -- Custom color for CmpItemMenu
      vim.cmd [[highlight CmpItemMenu guifg=#fabada]]
    end
  },

  'tpope/vim-commentary',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive', -- Git commands in nvim
  'tpope/vim-rhubarb', -- Fugitive-companion to interact with github
  'tpope/vim-unimpaired', -- Fugitive-companion to interact with github
  'tpope/vim-repeat',

  { "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Add git related info in the signs columns and popups
  'AndrewRadev/switch.vim',
  'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter-textobjects', -- Additional textobjects for treesitter

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  'jose-elias-alvarez/null-ls.nvim',

  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' } }, -- Autocompletion
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-git',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'andersevenrud/cmp-tmux',
  'onsails/lspkind.nvim',

  { 'L3MON4D3/LuaSnip', dependencies = { 'saadparwaiz1/cmp_luasnip' } }, -- Snippet Engine and Snippet Expansion
  "rafamadriz/friendly-snippets",
  "benfowler/telescope-luasnip.nvim",

  { 'kyazdani42/nvim-web-devicons' }, -- Fancier statusline
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true } }, -- Fancier statusline
  {
    'kdheepak/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd [[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    dependencies = { { 'nvim-lualine/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  },
  'p00f/nvim-ts-rainbow', -- Rainbow braces
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy Finder (files, lsp, etc)
  'rking/ag.vim', -- Search for thing
  "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig", -- Show code context
  'ethanholz/nvim-lastplace',

  'vim-scripts/matchit.zip', -- Better % matching
  'mhinz/vim-sayonara', -- Smart logic to close buffers
  'mong8se/actually.nvim', -- Open files with partial names

  'christoomey/vim-sort-motion', -- gs to sort things
  'gelguy/wilder.nvim', -- Better wildmenu
  'stsewd/isort.nvim',

  'junegunn/vim-easy-align', -- Align code
  'junegunn/vim-peekaboo', -- Show regs
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Programming languages
  {
    'hashivim/vim-terraform',
    config = function()
      vim.g.terraform_fmt_on_save = true
    end
  },
  'juliosueiras/vim-terraform-completion',

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 },

  'tommcdo/vim-exchange',
  'kevinhwang91/nvim-bqf',

  'stevearc/dressing.nvim',
  'NvChad/nvim-colorizer.lua',
  {
    'AckslD/nvim-trevJ.lua',
    config = 'require("trevj").setup()', -- optional call for configurating non-default filetypes etc

    -- uncomment if you want to lazy load
    -- module = 'trevj',

    -- an example for configuring a keybind, can also be done by filetype
    setup = function()
      vim.keymap.set(
        'n',
        '<leader>J',
        function() require('trevj').format_at_cursor() end
      )
    end,
  },
  'justinmk/vim-dirvish', -- Better directory navigation
  'azabiong/vim-highlighter', -- Highlight specific words

  'ixru/nvim-markdown',
  ({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() 
      vim.g.vim_markdown_conceal=0
      vim.g.mkdp_filetypes = { "markdown" } 
    end,
    ft = { "markdown" }, }),
  {
    'luk400/vim-jukit',
    setup = function()
      vim.g.jukit_mappings = 1
    end
  },

  {
    'jinh0/eyeliner.nvim',
    config = function()
      require'eyeliner'.setup {
        highlight_on_key = true
      }
    end
  },


}
