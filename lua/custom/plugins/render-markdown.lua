return {
  {
    'jbyuki/nabla.nvim',
    ft = { 'markdown', 'Avante' },
    version = '*',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    version = '*',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    -- event = 'VeryLazy',
    ft = { 'markdown', 'Avante' },
    opts = {
      completions = { blink = { enabled = true } },
      file_types = { 'markdown', 'Avante' },
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
