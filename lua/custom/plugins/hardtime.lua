return {
  {
    'm4xshen/hardtime.nvim',
    version = '*',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      -- Add "oil" to the disabled_filetypes
      disabled_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason', 'oil' },
    },
  },
}
