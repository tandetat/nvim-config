return {
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa-paper').setup {
        transparent = true,
        integrations = {
          wezterm = {
            enabled = false,
            path = (os.getenv 'TEMP' or '/tmp') .. '/nvim-theme',
          },
        },
      }
      vim.cmd.colorscheme 'kanagawa-paper'
      local hour = os.date('*t').hour
      vim.o.background = (hour >= 7 and hour < 19) and 'light' or 'dark'
    end,
  },
}
