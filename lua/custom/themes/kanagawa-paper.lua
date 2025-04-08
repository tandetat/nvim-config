return {
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    commit = '9e4c9aa',
    config = function()
      require('kanagawa-paper').setup {
        transparent = true,
        plugins = {
          mini = true,
        },
        integrations = {
          wezterm = {
            enabled = true,
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
