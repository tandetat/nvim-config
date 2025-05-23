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
vim.cmd.colorscheme 'kanagawa-paper'
-- local hour = os.date('*t').hour
-- vim.o.background = (hour >= 7 and hour < 18) and 'light' or 'dark'
-- vim.cmd.colorscheme 'ash'
-- local palette = require('ash').palette
-- require('kanagawa-paper.extras.wezterm').generate(colors)
-- local colors = require('kanagawa-paper.colors').setup()
-- local theme_colors = colors.theme

-- vim.api.nvim_set_hl(0, 'NavicSeparator', { link = 'Delimiter' })

-- vim: ts=2 sts=2 sw=2 et
