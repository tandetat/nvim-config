return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { { 'neovim/nvim-lspconfig' } },
    opts = {
      highlight = true,
    },
    -- config = function()
    --   require('nvim-navic').setup { highlight = true }
    --   -- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    -- end,
  },
}
