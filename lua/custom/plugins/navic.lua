return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    enabled = false,
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
