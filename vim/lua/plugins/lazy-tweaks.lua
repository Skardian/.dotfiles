return {
  {
    "LazyVim/LazyVim",
    opts = {
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = false, -- lazyvim.config.keymaps
        options = true, -- lazyvim.config.options
      },
    }
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",

    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    },

    -- dependencies = {
    --   "nvim-telescope/telescope-fzf-native.nvim",
    --   build = "make",
    --   config = function()
    --     require("telescope").load_extension("fzf")
    --   end,
    -- },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "│",
      char_blankline = "",
      show_trailing_blankline_indent = false,
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
    },
    config = function(_, opts)
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
      require("indent_blankline").setup(opts)
    end,
  },


  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = { -- Same colors as in indent-blankline
          '#E06C75',
          '#E5C07B',
          '#98C379',
          '#56B6C2',
          '#61AFEF',
          '#C678DD',
        },
      }
    },
  },

  -- Use tab to complete
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- Automatically format on save
      autoformat = false,
    }
  },

}
