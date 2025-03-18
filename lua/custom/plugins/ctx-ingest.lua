return {
  {
    '0xrusowsky/nvim-ctx-ingest',
    dependencies = {
      'nvim-web-devicons', -- required for file icons
    },
    lazy = true,
    cmd = 'CtxIngest',
    keys = { -- Example mapping to toggle outline
      { '<leader>ci', '<cmd>CtxIngest<CR>', desc = 'Toggle [C]tx [I]ngest' },
    },
    opts = {},
  },
}
