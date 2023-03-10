return {
  {
    "echasnovski/mini.ai",
    opts = {
      mappings = {
        -- Main textobject prefixes

        -- Next/last variants
        around_next = 'aN',
        inside_next = 'iN',
        around_last = 'aL',
        inside_last = 'iL',
      },

      custom_textobjects = {
        l = function(ai_type)
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
    config = function(_, opts)
      require("mini.ai").setup(opts)
      -- register all text objects with which-key
      if require("lazyvim.util").has("which-key.nvim") then
        ---@type table<string, string|table>
        local i = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          f = "Function",
          o = "Block, conditional, loop",
          q = "Quote `, \", '",
          t = "Tag",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ N = "Next", L = "Last" }) do -- This had to be changed
          i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register({
          mode = { "o", "x" },
          i = i,
          a = a,
        })
      end
    end,
  },
}
