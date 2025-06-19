-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Lazy keymap
vim.keymap.set('n', '<leader>L', ':Lazy<CR>', { desc = 'Open [L]azy.nvim' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Motions

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Go down and center line' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go up and center line' })

-- [[Yank Diagnostics]]
vim.keymap.set('n', '<leader>zy', function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local buf = vim.diagnostic.open_float()
  if not buf then
    vim.notify(('No diagnostics on line %s'):format(line), vim.log.levels.ERROR)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, true)

  if vim.fn.setreg('+', lines) ~= 0 then
    vim.notify(('An error happened while trying to copy the diagnostics on line %s'):format(line))
    return
  end

  vim.notify(([[Diagnostics from line %s copied to clipboard.

%s]]):format(line, vim.fn.getreg '+'))
end, { desc = 'Copy current line diagnostics' })

-- [[Buffer Management]]
vim.keymap.set('n', '<C-b>', '<cmd>w<cr><cmd>bd<cr>', { desc = 'Save and delete current buffer' })

-- [[RSS feeds]]
-- vim.keymap.set('n', '<leader>fu', '<cmd>Feed update<cr>', { desc = 'Feed update' })
-- vim.keymap.set('n', '<leader>fi', '<cmd>Feed index<cr>', { desc = 'Feed index' })
-- vim.keymap.set('n', '<leader>ff', '<cmd>Feed<cr>', { desc = 'Feed menu' })
-- vim.keymap.set('n', '<leader>fg', '<cmd>Feed search<cr>', { desc = 'Feed search' })

-- [[ Molten ]]
-- vim.keymap.set('n', '<localleader>e', ':MoltenEvaluateOperator<CR>', { desc = 'evaluate operator', silent = true })
-- vim.keymap.set('n', '<localleader>os', ':noautocmd MoltenEnterOutput<CR>', { desc = 'open output window', silent = true })
-- vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { desc = 're-eval cell', silent = true })
-- vim.keymap.set('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { desc = 'execute visual selection', silent = true })
-- vim.keymap.set('n', '<localleader>oh', ':MoltenHideOutput<CR>', { desc = 'close output window', silent = true })
-- vim.keymap.set('n', '<localleader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true })
--
-- -- if you work with html outputs:
-- vim.keymap.set('n', '<localleader>mx', ':MoltenOpenInBrowser<CR>', { desc = 'open output in browser', silent = true })
-- Provide a command to create a blank new Python notebook
-- note: the metadata is needed for Jupytext to understand how to parse the notebook.
-- if you use another language than Python, you should change it in the template.
-- local default_notebook = [[
--   {
--     "cells": [
--      {
--       "cell_type": "markdown",
--       "metadata": {},
--       "source": [
--         ""
--       ]
--      }
--     ],
--     "metadata": {
--      "kernelspec": {
--       "display_name": "Python 3",
--       "language": "python",
--       "name": "python3"
--      },
--      "language_info": {
--       "codemirror_mode": {
--         "name": "ipython"
--       },
--       "file_extension": ".py",
--       "mimetype": "text/x-python",
--       "name": "python",
--       "nbconvert_exporter": "python",
--       "pygments_lexer": "ipython3"
--      }
--     },
--     "nbformat": 4,
--     "nbformat_minor": 5
--   }
-- ]]
--
-- local function new_notebook(filename)
--   local path = filename .. '.ipynb'
--   local file = io.open(path, 'w')
--   if file then
--     file:write(default_notebook)
--     file:close()
--     vim.cmd('edit ' .. path)
--   else
--     print 'Error: Could not open new notebook file for writing.'
--   end
-- end

-- vim.api.nvim_create_user_command('NewNotebook', function(opts)
--
--   new_notebook(opts.args)
-- end, {
--   nargs = 1,
--   complete = 'file',
-- })
-- vim.keymap.set('n', '<localleader>ip', function()
--   local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
--   if venv ~= nil then
--     -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
--     venv = string.match(venv, '/.+/(.+)')
--     vim.cmd(('MoltenInit %s'):format(venv))
--   else
--     vim.cmd 'MoltenInit python3'
--   end
-- end, { desc = 'Initialize Molten for python3', silent = true })
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- vim: ts=2 sts=2 sw=2 et
