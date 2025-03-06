return {
  { 'jbyuki/nabla.nvim', event = 'VeryLazy' },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    event = 'VeryLazy',
    ft = 'markdown',
    opts = {
      latex = { enabled = false },
      win_options = { conceallevel = { rendered = 2 } },
      on = {
        render = function()
          require('nabla').enable_virt { autogen = true }
        end,
        clear = function()
          require('nabla').disable_virt()
        end,
      },
    },
  },
}
