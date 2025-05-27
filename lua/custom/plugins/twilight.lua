return {
  {
    'folke/twilight.nvim',
    lazy = true,
    version = '*',
    config = function()
      local colors = require('kanagawa-paper.colors').setup()
      local bg = colors.theme.ui.bg
      -- local fg_dim = theme_colors.ui.fg_reverse
      require('twilight').setup {
        dimming = { alpha = 0.5, color = { 'Comment' }, term_bg = bg },
      }
    end,
  },
}
