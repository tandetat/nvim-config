-- Inspired by ZazenCodes obsidian + neovim notes workflows

--------------
-- obsidian --
--------------
--
-- >>> oo # from shell, navigate to vault (optional)
--
-- # NEW NOTE
-- >>> on "Note Name" # call my "obsidian new note" shell script (~/bin/on)
-- >>>
-- >>> ))) <leader>on # inside vim now, format note as template
-- >>> ))) # add tag, e.g. fact / blog / video / etc..
-- >>> ))) # add hubs, e.g. [[python]], [[machine-learning]], etc...
-- >>> ))) <leader>of # format title
--
-- # END OF DAY/WEEK REVIEW
-- >>> or # review notes in inbox
-- >>>
-- >>> ))) <leader>ok # inside vim now, move to zettelkasten
-- >>> ))) <leader>odd # or delete
-- >>>
-- >>> og # organize saved notes from zettelkasten into notes/[tag] folders
-- >>> ou # sync local with Notion

-- Format notes
-- vim.keymap.set(
--   'n',
--   '<leader>on',
--   ':Obsidian template fleeting-notes<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>',
--   { desc = '[O]bsidian Second Brain [N]ote' }
-- )
-- [[Automate note formatting]]
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/daily-notes/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template daily-notes'
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/weekly-notes/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template weekly-notes'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/monthly-notes/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template monthly-notes'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/fleeting/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template fleeting-notes'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/literature/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template literature-notes'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/notes/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template atomic-notes'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/ttprgs/*.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template campaigns'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/ttprgs/*-gm/.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template session-gm'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*/ttprgs/*-player/.md',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd 'Obsidian template session-player'
    end
  end,
})
