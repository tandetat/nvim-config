return {
  {
    'tris203/precognition.nvim',
    dir = '~/prs/precognition.nvim',

    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'chrisgrieser/nvim-spider', opts = {}, lazy = true },
    },
    opts = {},
    -- version = '1.2.0',
  },
}
