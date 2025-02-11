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
vim.keymap.set(
  'n',
  '<leader>on',
  ':ObsidianTemplate second-brain<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>',
  { desc = '[O]bsidian Second Brain [N]ote' }
)
vim.keymap.set('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>', { desc = '[O]bsidian Second Brain [F]ormat Title' })

-- search for files in personal vault
vim.keymap.set('n', '<leader>os', ':Telescope find_files search_dirs={"/Users/diogo/vaults/personal-vault"}<cr>', { desc = '[O]bsidian File [S]earch' })
vim.keymap.set('n', '<leader>oz', ':Telescope live_grep search_dirs={"/Users/diogo/vaults/personal-vault"}<cr>', { desc = '[O]bsidian Fu[z]zy Search' })

--- [[ Zen Mode ]]
vim.keymap.set('n', '<leader>z', ':ZenMode<cr>', { desc = '[Z]en Mode' })
