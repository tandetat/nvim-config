return {
  {
    'tandetat/para.nvim',
    lazy = true,
    enabled = false,
    keys = {
      { '<leader>pp', '<cmd>ParaNewProject<cr>', desc = 'New [P]ARA method [p]roject note' },
      { '<leader>pa', '<cmd>ParaNewArea<cr>', desc = 'New [P]ARA method [a]rea note' },
      { '<leader>pr', '<cmd>ParaNewResource<cr>', desc = 'New [P]ARA method [r]esource note' },
    },
    opts = {
      vault_dir = os.getenv 'VAULT_DIR',
    },
  },
}
