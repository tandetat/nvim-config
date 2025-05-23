return {
  {
    'unblevable/quick-scope',
    lazy = true,
    keys = {
      { '<leader>Q', '<cmd>QuickScopeToggle<cr>', desc = 'Toggle [Q]uick-Scope' },
    },
    config = function()
      vim.g.qs_enable = 0
      vim.g.qs_buftype_blacklist = { 'terminal', 'nofile' }
      vim.api.nvim_set_hl(0, 'QuickScopePrimary', { link = 'Search' })
      vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { link = 'Search' })
    end,
  },
}
