return {
  {
    'forest-nvim/maple.nvim',
    lazy = true,
    keys = {
      { '<leader>ma', '<cmd>MapleNotes<CR>', desc = 'Toggle Maple [T]o[D]o List' },
    },
    opts = {
      keymaps = {
        toggle = '<leader>ma',
        close = 'q',
        switch_mode = 'm',
      },
    },
  },
}
