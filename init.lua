-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'
-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Workflows ]]
require 'workflows'

-- [[Macros]]
require 'macros'
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]

require 'lazy-plugins'

-- [[Configure colorscheme ]]
-- vim.cmd.colorscheme 'kanagawa'
vim.cmd.colorscheme 'vague'

vim.cmd.packadd 'nvim.undotree'
vim.cmd.packadd 'nvim.difftool'
local function undotree()
  local close = require('undotree').open {
    title = 'undotree',
    command = 'topleft 30vnew',
  }
  if not close then
    vim.bo.filetype = 'undotree'
  end
end

vim.keymap.set('n', '<leader>u', undotree)
vim.api.nvim_create_user_command('Undotree', undotree, {})
-- vim: ts=2 sts=2 sw=2 et
