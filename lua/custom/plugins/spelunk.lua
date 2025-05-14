return {
  {
    'EvWilson/spelunk.nvim',
    enabled = false,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim', -- For window drawing utilities
      { 'nvim-telescope/telescope.nvim', lazy = true }, -- Optional: for fuzzy search capabilities
      { 'nvim-treesitter/nvim-treesitter', lazy = true }, -- Optional: for showing grammar context
    },
    config = function()
      local spelunk = require 'spelunk'
      spelunk.setup {
        enable_persist = true,
      }
      spelunk.display_function = function(mark)
        local ctx = require('spelunk.util').get_treesitter_context(mark)
        ctx = (ctx == '' and ctx) or (' - ' .. ctx)
        local filename = spelunk.filename_formatter(mark.file)
        return string.format('%s:%d%s', filename, mark.line, ctx)
      end
    end,
  },
}
