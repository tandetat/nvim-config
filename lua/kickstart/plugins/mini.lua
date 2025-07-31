return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.move').setup {
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<leader>h',
          right = '<leader>l',
          up = '<leader>k',
          down = '<leader>j',

          -- Move current line in Normal mode
          line_left = '<leader>h',
          line_right = '<leader>l',
          line_down = '<leader>j',
          line_up = '<leader>k',
        },
      }
      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      local snippets = require 'mini.snippets'
      snippets.setup {
        mappings = {
          expand = '<C-e>',

          -- Interact with default `expand.insert` session.
          -- Created for the duration of active session(s)
          jump_next = '<C-n>',
          jump_prev = '<C-p>',
          stop = '<C-c>',
        },
        snippets = {
          -- Load snippets based on current language by reading files from
          -- "snippets/" subdirectories from 'runtimepath' directories.
          snippets.gen_loader.from_lang(),
        },
      }
      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
