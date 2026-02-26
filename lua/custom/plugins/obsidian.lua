return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    enabled = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre "
    --   -- refer to `:h file-pattern` for more examples
    --   'BufReadPre '
    --     .. os.getenv 'VAULT_DIR'
    --     .. '/**/*.md',
    --
    --   'BufNewFile ' .. os.getenv 'VAULT_DIR' .. '/**/*.md',
    -- },
    -- cond = function()
    --   local path = vim.fn.expand '%:p'
    --   return path:find(os.getenv 'vault_dir')
    -- end,
    opts = {
      legacy_commands = false,
      -- A list of workspace names, paths, and configuration overrides.ob
      -- If you use the Obsidian app, the 'path' of a workspace should generally be
      -- your vault root (where the `.obsidian` folder is located).
      -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
      -- the workspace to the first workspace in the list whose `path` is a parent of the
      -- current markdown file being edited.
      workspaces = {
        {
          name = 'personal',
          path = '~/vaults/second-brain',
        },
        {
          name = 'ttrpg',
          path = '~/vaults/ttrpg-vault',
          -- Optional, override certain settings.
          overrides = {
            notes_subdir = 'notes',
          },
        },
      },
    },
  },
}
