return {
  {
    'stevearc/aerial.nvim',
    lazy = true,
    cmd = { 'AerialOpen', 'AerialOpenAll', 'AerialToggle' },
    keys = { -- Example mapping to toggle outline
      { '<leader>A', '<cmd>AerialOpen<CR>', desc = 'Toggle [A]erial' },
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
