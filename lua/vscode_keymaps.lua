local opts = {
  noremap = true,
  silent = true,
}

-- remap leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- general keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>t', function()
  require('vscode').action 'workbench.action.terminal.toggleTerminal'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>b', function()
  require('vscode').action 'editor.debug.action.toggleBreakpoint'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>d', function()
  require('vscode').action 'editor.action.showHover'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>a', function()
  require('vscode').action 'editor.action.quickFix'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>sp', function()
  require('vscode').action 'workbench.actions.view.problems'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>cn', function()
  require('vscode').action 'notifications.clearAll'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
  require('vscode').action 'workbench.action.quickOpen'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>cp', function()
  require('vscode').action 'workbench.action.showCommands'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>pr', function()
  require('vscode').action 'code-runner.run'
end, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>fd', function()
  require('vscode').action 'editor.action.formatDocument'
end, opts)
-- vim: ts=2 sts=2 sw=2 et
