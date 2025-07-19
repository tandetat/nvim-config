local map = vim.keymap.set
local silent = { silent = true, noremap = true }
map('', '<Space>', '<Nop>', silent)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Set termguicolors
vim.o.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Folding
vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- Prefer LSP folding if client supports it
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client:supports_method 'textDocument/foldingRange' then
--       local win = vim.api.nvim_get_current_win()
--       vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
--     end
--   end,
-- })
vim.cmd [[ set nofoldenable]]

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.o.undofile = true
vim.o.laststatus = 0
vim.opt.expandtab = true
vim.opt.softtabstop = -1

vim.pack.add {

  -- 'https://github.com/nvim-lua/plenary.nvim',

  'https://github.com/thesimonho/kanagawa-paper.nvim',

  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },

  -- 'https://github.com/nvim-treesitter/nvim-treesitter-context',

  'https://github.com/folke/snacks.nvim',
}

require('kanagawa-paper').setup {
  transparent = true,
  plugins = {
    mini = false,
  },
  integrations = {
    wezterm = {
      enabled = true,
      path = (os.getenv 'TEMP' or '/tmp') .. '/nvim-theme',
    },
  },
}

vim.cmd.colorscheme 'kanagawa-paper'
-- map('n', '<space>y', function()
--   vim.fn.setreg('+', vim.fn.expand '%:p')
-- end)
map('n', '<space>c', function()
  vim.ui.input({}, function(c)
    if c and c ~= '' then
      vim.cmd.noswapfile 'vnew'
      vim.bo.buftype = 'nofile'
      vim.bo.bufhidden = 'wipe'
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
    end
  end)
end)
-- local treesitter = require 'nvim-treesitter'
-- local trees = {
--   'bash',
--   'c',
--   'diff',
--   'lua',
--   'luadoc',
--   'markdown',
--   'vim',
--   'vimdoc',
--   'comment',
--   'dockerfile',
--   'fish',
--   'git_config',
--   'git_rebase',
--   'gitattributes',
--   'gitcommit',
--   'gitignore',
--   'go',
--   'javascript',
--   'python',
--   'typescript',
--   'rust',
--   'yaml',
-- }
-- treesitter.install(trees)
-- treesitter.update()
-- require('nvim-treesitter.configs').setup {
--   textobjects = {
--     enable = true,
--     move = {
--       enable = true,
--       set_jumps = false, -- you can change this if you want.
--       goto_next_start = {
--         --- ... other keymaps
--         [']b'] = { query = '@code_cell.inner', desc = 'next code block' },
--       },
--       goto_previous_start = {
--         --- ... other keymaps
--         ['[b'] = { query = '@code_cell.inner', desc = 'previous code block' },
--       },
--     },
--     select = {
--       enable = true,
--       lookahead = true, -- you can change this if you want
--       keymaps = {
--         --- ... other keymaps
--         ['ib'] = { query = '@code_cell.inner', desc = 'in block' },
--         ['ab'] = { query = '@code_cell.outer', desc = 'around block' },
--       },
--     },
--     swap = { -- Swap only works with code blocks that are under the same
--       -- markdown header
--       enable = true,
--       swap_next = {
--         --- ... other keymap
--         ['<leader>sbl'] = '@code_cell.outer',
--       },
--       swap_previous = {
--         --- ... other keymap
--         ['<leader>sbh'] = '@code_cell.outer',
--       },
--     },
--   },
--   ensure_installed = {
--     'bash',
--     'c',
--     'diff',
--     'html',
--     'lua',
--     'luadoc',
--     'markdown',
--     'markdown_inline',
--     'query',
--     'vim',
--     'vimdoc',
--     'latex',
--     'comment',
--     'csv',
--     'css',
--     'dockerfile',
--     'fish',
--     'git_config',
--     'git_rebase',
--     'gitattributes',
--     'gitcommit',
--     'gitignore',
--     'go',
--     'javascript',
--     'python',
--     'typescript',
--     'tsx',
--     'rust',
--     'yaml',
--     'xml',
--   },
--   -- Autoinstall languages that are not installed
--   auto_install = true,
--   highlight = {
--     enable = true,
--     -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--     --  If you are experiencing weird indenting issues, add the language to
--     --  the list of additional_vim_regex_highlighting and disabled languages for indent.
--     additional_vim_regex_highlighting = { 'ruby' },
--     disable = { 'latex' },
--   },
--   indent = { enable = true, disable = { 'ruby' } },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = 'gnn',
--       node_incremental = 'grn',
--       scope_incremental = 'grc',
--       node_decremental = 'grm',
--     },
--   },
-- }
-- require('treesitter-context').setup {
--   enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--   multiwindow = false, -- Enable multiwindow support.
--   max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
--   min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
--   line_numbers = true,
--   multiline_threshold = 20, -- Maximum number of lines to show for a single context
--   trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
--   mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
--   -- Separator between context and content. Should be a single character string, like '-'.
--   -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
--   separator = nil,
--   zindex = 20, -- The Z-index of the context window
--   on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
-- }

require('snacks').setup {
  bigfile = {
    enabled = true,
  },
  picker = {
    enabled = true,
  },
  dim = {
    enabled = true,
  },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
        { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
        { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
        { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
    },
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
      { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
      { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
      {
        pane = 2,
        icon = ' ',
        desc = 'Browse Repo',
        padding = 1,
        key = 'b',
        action = function()
          Snacks.gitbrowse()
        end,
      },
      function()
        local in_git = Snacks.git.get_root() ~= nil
        local cmds = {
          {
            title = 'Notifications',
            cmd = 'gh notify -s -a -n5',
            action = function()
              vim.ui.open 'https://github.com/notifications'
            end,
            key = 'N',
            icon = ' ',
            height = 5,
            enabled = true,
          },
          {
            title = 'Open Issues',
            cmd = 'gh issue list -L 3',
            key = 'i',
            action = function()
              vim.fn.jobstart('gh issue list --web', { detach = true })
            end,
            icon = ' ',
            height = 7,
          },
          {
            icon = ' ',
            title = 'Open PRs',
            cmd = 'gh pr list -L 3',
            key = 'P',
            action = function()
              vim.fn.jobstart('gh pr list --web', { detach = true })
            end,
            height = 7,
          },
          {
            icon = ' ',
            title = 'Git Status',
            cmd = 'git --no-pager diff --stat -B -M -C',
            height = 10,
          },
        }
        return vim.tbl_map(function(cmd)
          return vim.tbl_extend('force', {
            pane = 2,
            section = 'terminal',
            enabled = in_git,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          }, cmd)
        end, cmds)
      end,
      -- { section = 'startup' },
    },
  },
}

map({ 'n', 'v' }, '<leader>z', function()
  if Snacks.dim.enabled then
    Snacks.dim.disable()
  else
    Snacks.dim.enable()
  end
end, { desc = 'Dim' })
local snacks_keys = {
  {
    '<leader>S',
    function()
      Snacks.picker.smart()
    end,
    desc = 'Smart Find Files',
  },
  {
    '<leader>:',
    function()
      Snacks.picker.command_history()
    end,
    desc = 'Command History',
  },
  {
    '<leader>sn',
    function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
    end,
    desc = 'Find [N]eovim File',
  },
  {
    '<leader>sm',
    function()
      Snacks.picker.marks()
    end,
    desc = 'Marks',
  },
  {
    '<leader>sq',
    function()
      Snacks.picker.qflist()
    end,
    desc = 'Quickfix List',
  },
  {
    '<leader>su',
    function()
      Snacks.picker.undo()
    end,
    desc = 'Undo History',
  },
  {
    '<leader><space>',
    function()
      Snacks.picker.buffers()
    end,
    desc = 'Buffers',
  },
  {
    '<leader>sm',
    function()
      Snacks.picker.marks()
    end,
    desc = 'Marks',
  },
  {
    '<leader>sD',
    function()
      Snacks.picker.diagnostics_buffer()
    end,
    desc = 'Buffer Diagnostics',
  },
  {
    '<leader>s/',
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = 'Grep Open Buffers',
  },
  {
    '<leader>sG',
    function()
      Snacks.picker.grep()
    end,
    desc = 'Grep',
  },
  {
    '<leader>sf',
    function()
      Snacks.picker.files()
    end,
    desc = 'Find Files',
  },
  {
    '<leader>/',
    function()
      Snacks.picker.lines()
    end,
    desc = 'search open buffer',
  },
  {
    '<leader>sh',
    function()
      Snacks.picker.help()
    end,
    desc = 'Help Pages',
  },
  {
    '<leader>sd',
    function()
      Snacks.picker.diagnostics()
    end,
    desc = 'Diagnostics',
  },
  {
    '<leader>sk',
    function()
      Snacks.picker.keymaps()
    end,
    desc = 'Keymaps',
  },
}
for _, value in ipairs(snacks_keys) do
  map({ 'n', 'v' }, value[1], value[2], { noremap = false, silent = true, desc = value[3] })
end
-- vim: ts=2 sts=2 sw=2 et
