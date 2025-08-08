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

local function copy_visual_line_range()
  vim.cmd [[ execute "normal! \<Esc>" ]]
  local s = vim.fn.getpos "'<"
  local e = vim.fn.getpos "'>"
  local l1, l2 = s[2], e[2]
  if l1 > l2 then
    l1, l2 = l2, l1
  end
  local txt = string.format('(%d-%d)', l1, l2)
  vim.fn.setreg('+', txt)
  print('Copied to clipboard: ' .. txt)
end

vim.keymap.set('x', '<leader>r', copy_visual_line_range, { noremap = true, silent = true, desc = 'Copy selection line range' })
-- vim: ts=2 sts=2 sw=2 et
