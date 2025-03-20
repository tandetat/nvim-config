return {
  -- Lua
  {
    'folke/twilight.nvim',
    lazy = true,
    config = function()
      local colors = require('kanagawa-paper.colors').setup()
      local theme_colors = colors.theme
      local bg = theme_colors.ui.bg
      local fg_dim = theme_colors.ui.fg_reverse
      require('twilight').setup {
        dimming = { alpha = 0.5, color = { fg_dim }, term_bg = bg },
      }
    end,
  },
}
