return {
  {
    'mbbill/undotree',
    lazy = true,
    version = '*',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle [U]ndoTree' },
    },
  },
}
