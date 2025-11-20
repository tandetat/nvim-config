return {
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    keys = {
      {
        '<leader>fg',
        function()
          require('grug-far').open { transient = true }
        end,
        desc = 'Search with [G]rug Far',
      },
      {
        '<leader>fw',
        function()
          require('grug-far').open { transient = true, prefills = { search = vim.fn.expand '<cword>' } }
        end,
        desc = 'Search current [w]ord',
      },
      {
        '<leader>fa',
        function()
          require('grug-far').open { transient = true, engine = 'astgrep' }
        end,
        desc = 'Search with [a]st grep',
      },
      {
        '<leader>f',
        function()
          require('grug-far').open { transient = true, visualSelectionUsage = 'operate-within-range' }
        end,
        mode = { 'v', 'x' },
        desc = 'Search with within visual range',
      },
    },
    opts = {},
  },
}
