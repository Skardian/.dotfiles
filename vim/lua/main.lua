------------------------------------------------------------------------
--                             Telescope                              --
------------------------------------------------------------------------
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close, -- Does not work
      },
    },
  }
})
require('telescope').load_extension('fzf')

------------------------------------------------------------------------
--                          Setup nvim-cmp.                           --
------------------------------------------------------------------------
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
      ["<S-Tab>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ["<Tab>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
      ['<C-p>'] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'path' },
        { name = 'tmux' },
      }, {
        { name = 'buffer' },
      })
  })

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
  })

------------------------------------------------------------------------
--                             Gitsigns                               --
------------------------------------------------------------------------
require('gitsigns').setup{
  on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
      map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
      map('n', '<leader>tb', gs.toggle_current_line_blame)

      -- Text objects
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      map({'o', 'x'}, 'ah', ':<C-U>Gitsigns select_hunk<CR>')
  end,
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

------------------------------------------------------------------------
--                             Indentline                             --
------------------------------------------------------------------------
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}


------------------------------------------------------------------------
--                            Smart Pairs                             --
------------------------------------------------------------------------
require('pairs'):setup()

------------------------------------------------------------------------
--                              Dressing                              --
------------------------------------------------------------------------
require('dressing').setup({
  input = {
    anchor = "NW",
    winblend = 0,
    }
  })

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP keybinds
vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, {buffer=0})
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, {buffer=0}) -- used to be ]r with ale
vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, {buffer=0}) -- used to be [r with ale
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {buffer=0})
-- vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {buffer=0})
vim.keymap.set("n", "<leader>la", "<cmd>Telescope lsp_code_actions theme=cursor<cr>", {buffer=0})
vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})

------------------------------------------------------------------------
--                    Load gopls sample LSP config                    --
------------------------------------------------------------------------
require'lspconfig'.gopls.setup {
  capabilities = capabilities, -- Send the LSP what Neovim allows
}

------------------------------------------------------------------------
--                             Python LSP                             --
------------------------------------------------------------------------
-- require'lspconfig'.jedi_language_server.setup {
require'lspconfig'.pyright.setup{
  capabilities = capabilities, -- send the lsp what neovim allows
}

------------------------------------------------------------------------
--                            TerraformLS                             --
------------------------------------------------------------------------
require'lspconfig'.terraformls.setup{
  capabilities = capabilities,
}

------------------------------------------------------------------------
--                              NULL LS                               --
------------------------------------------------------------------------
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.shellcheck,
  null_ls.builtins.diagnostics.codespell.with({
      -- args = {"--dictionary", "-", "--ignore-words", "$HOME/.codespell-ignore"}
      command = "codespell-nvim",
      arg = {"-"},
      -- args = {"--dictionary=-"}


  }),
  null_ls.builtins.diagnostics.jsonlint,
}

null_ls.setup({ sources = sources })

------------------------------------------------------------------------
--                             TreeSitter                             --
------------------------------------------------------------------------
require("nvim-treesitter.configs").setup {
  indent = {
    enable = true,
    disable = {"python"}
  },
  yati = { enable = true },
}

------------------------------------------------------------------------
--                              Trouble                               --
------------------------------------------------------------------------
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
