return {
  {
    'SmiteshP/nvim-navic',
    enabled = true,
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
