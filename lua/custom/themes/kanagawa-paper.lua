return {
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    commit = '9e4c9aa',
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
