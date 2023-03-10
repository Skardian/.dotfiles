return {

  {
    "gelguy/wilder.nvim", -- Better wildmenu
    config = function ()
      local wilder = require('wilder')

      wilder.setup({modes = {':'}})

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline({
            -- sets the language to use, 'vim' and 'python' are supported
            language = 'vim',
            -- 0 turns off fuzzy matching
            -- 1 turns on fuzzy matching
            -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
            fuzzy = 1,
          })
        ),
      })


      local highlighters = {
        wilder.pcre2_highlighter(),
        wilder.basic_highlighter()
      }

      wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.popupmenu_renderer({
          highlighter = highlighters
        }),
      }))

      wilder.set_option('renderer', wilder.popupmenu_renderer({
        highlighter = highlighters,
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
      }))
    end

  }
}
