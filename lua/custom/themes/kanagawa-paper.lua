return {
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    version = '*',
    opts = {
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
    },
  },
}
