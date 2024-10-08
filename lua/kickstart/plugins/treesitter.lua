return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      -- helps select using syntax tree
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>', -- enter
          node_incremental = '<CR>', -- enter
          scope_incremental = false, --
          node_decremental = '<BS>', -- backspace
        },
      },
      textobjects = { -- equivalent to nvim-treesitter-textobjects.nvim
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            -- works in visual mode, change, delete for example
            ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of argument' },

            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            ['am'] = { query = '@function.outer', desc = 'Select outer part of a method definition' },
            ['im'] = { query = '@function.inner', desc = 'Select inner part of a method definition' },

            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist (ctrl + o, ctrl + i)
          goto_next_start = {
            ['[f'] = { query = '@call.outer', desc = 'Next function call start' },
            ['[m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            ['[c'] = { query = '@class.outer', desc = 'Next class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Next loop start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ['[s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            ['[z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']f'] = { query = '@call.outer', desc = 'Next function call end' },
            [']m'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']c'] = { query = '@class.outer', desc = 'Next class end' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[F'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[M'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            [']F'] = { query = '@call.outer', desc = 'Prev function call end' },
            [']M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            [']C'] = { query = '@class.outer', desc = 'Prev class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            -- i have added 4 keys because this would be rather rarely used keymap
            -- hence its more important to me that it's memorable with [s]wap
            ['<leader>sna'] = '@parameter.inner', -- swap argument/parameter with next
            ['<leader>snm'] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>spa'] = '@parameter.inner', -- swap argument/parameter with previous
            ['<leader>spm'] = '@function.outer', -- swap function with previous
          },
        },
      },
    },
  },
}
