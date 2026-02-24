return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      {
        '<leader>n',
        function()
          Snacks.notifier.show_history()
        end,
        desc = 'Show [N]otification History',
      },
      {
        '<leader>gi',
        function()
          Snacks.picker.gh_issue()
        end,
        desc = 'GitHub Issues (open)',
      },
      {
        '<leader>gI',
        function()
          Snacks.picker.gh_issue { state = 'all' }
        end,
        desc = 'GitHub Issues (all)',
      },
      {
        '<leader>gp',
        function()
          Snacks.picker.gh_pr()
        end,
        desc = 'GitHub Pull Requests (open)',
      },
      {
        '<leader>gP',
        function()
          Snacks.picker.gh_pr { state = 'all' }
        end,
        desc = 'GitHub Pull Requests (all)',
      },
      {
        '<leader>S',
        function()
          Snacks.picker.smart()
        end,
        desc = '[S]mart Find Files',
      },
      {
        '<leader>Z',
        function()
          Snacks.picker.zoxide()
        end,
        desc = '[Z]oxide',
      },
      {
        '<leader>P',
        function()
          Snacks.picker.projects {
            dev = { '~/dev' },
          }
        end,
        desc = '[P]rojects',
      },
      {
        '<leader>sp',
        function()
          local vault = os.getenv 'VAULT_DIR'
          Snacks.picker.files {
            dirs = { vault .. '/resources', vault .. '/projects', vault .. '/areas', vault .. '/archive' },
            follow = false,
          }
        end,
        desc = '[S]earch [P]ara',
      },
      {
        '<leader>sP',
        function()
          local vault = os.getenv 'VAULT_DIR'
          Snacks.picker.grep {
            dirs = { vault .. '/resources', vault .. '/projects', vault .. '/areas', vault .. '/archive' },
            follow = true,
          }
        end,
        desc = 'Grep Para',
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
        '<leader>sF',
        function()
          Snacks.picker.files { follow = true }
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
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Visual selection or word',
        mode = { 'n', 'x' },
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
      {
        '<leader>sld',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = 'Search Definition',
      },
      {
        '<leader>slD',
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = 'Searc Declaration',
      },
      {
        '<leader>slr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'Search LSP References',
      },
      {
        '<leader>sli',
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = 'LSP Implementation',
      },
      {
        '<leader>slt',
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = 'LSP T[y]pe Definition',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
      },
    },
    opts = {
      notifier = {
        enabled = true,
        top_down = false,
      },
      bigfile = {
        enabled = true,
      },
      picker = {
        enabled = true,
      },
      gh = {
        enabled = true,
      },
      indent = {
        enabled = true,
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { icon = ' ', title = 'Project Recent Files ', file = vim.fn.fnamemodify('.', ':~'), padding = 1 },
          { section = 'recent_files', cwd = true, limit = 8, indent = 2, padding = 1 },
          -- { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          { section = 'startup' },
        },
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    -- optional = true,
    lazy = true,
    keys = {
      {
        '<leader>st',
        function()
          Snacks.picker.todo_comments()
        end,
        desc = 'Todo',
      },
      {
        '<leader>sT',
        function()
          Snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
        end,
        desc = 'Todo/Fix/Fixme',
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
