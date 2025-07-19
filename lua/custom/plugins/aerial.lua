return {
  {
    'stevearc/aerial.nvim',
    enabled = false,
    lazy = true,
    cmd = { 'AerialOpen', 'AerialOpenAll', 'AerialToggle', 'AerialNavToggle' },
    keys = { -- Example mapping to toggle outline
      { '<leader>A', '<cmd>AerialToggle<CR>', desc = 'Toggle [A]erial' },
      { '<leader>Na', '<cmd>AerialNavToggle<CR>', desc = 'Nav Toggle [A]erial' },
    },

    opts = {},
    -- Optional dependencies
  },
  {

    'nvim-treesitter/nvim-treesitter',
    lazy = true,
  },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
}
