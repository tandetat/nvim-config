return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      textobjects = {
        move = {
          enable = true,
          set_jumps = false, -- you can change this if you want.
          goto_next_start = {
            --- ... other keymaps
            [']b'] = { query = '@code_cell.inner', desc = 'next code block' },
          },
          goto_previous_start = {
            --- ... other keymaps
            ['[b'] = { query = '@code_cell.inner', desc = 'previous code block' },
          },
        },
        select = {
          enable = true,
          lookahead = true, -- you can change this if you want
          keymaps = {
            --- ... other keymaps
            ['ib'] = { query = '@code_cell.inner', desc = 'in block' },
            ['ab'] = { query = '@code_cell.outer', desc = 'around block' },
          },
        },
        swap = { -- Swap only works with code blocks that are under the same
          -- markdown header
          enable = true,
          swap_next = {
            --- ... other keymap
            ['<leader>sbl'] = '@code_cell.outer',
          },
          swap_previous = {
            --- ... other keymap
            ['<leader>sbh'] = '@code_cell.outer',
          },
        },
      },
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        -- 'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'latex',
        'comment',
        'csv',
        'css',
        'dockerfile',
        'fish',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'javascript',
        'php',
        'python',
        'typescript',
        'rust',
        'yaml',
        'xml',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
        disable = { 'latex' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
