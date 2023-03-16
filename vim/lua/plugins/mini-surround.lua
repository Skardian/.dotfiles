return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = 'ys',
      delete = 'ds',
      find = '',
      find_left = '',
      highlight = '',
      replace = 'cs',
      update_n_lines = '',
    },
    search_method = 'cover_or_next',
    custom_surroundings = {
      ['b'] = { output = { left = '(', right = ')' } },
      ['B'] = { output = { left = '{', right = '}' } },
    },
  },

config = function(_, opts)
    -- use gz mappings instead of s to prevent conflict with leap
    require("mini.surround").setup(opts)
    -- Remap adding surrounding to Visual mode selection
    vim.keymap.del('x', 'ys')
    vim.keymap.set('x', 'S', [[<cmd><C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
    -- Make special mapping for "add surrounding for line"
    vim.keymap.set('n', 'yss', 'ys_', { remap = true })
  end,
}
