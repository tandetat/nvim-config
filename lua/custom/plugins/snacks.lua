return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
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
      -- {
      --   'gd',
      --   function()
      --     Snacks.picker.lsp_definitions()
      --   end,
      --   desc = 'Goto Definition',
      -- },
      {
        'gD',
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = 'Goto Declaration',
      },
      {
        'grR',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'Search LSP References',
      },
      -- {
      --   'gI',
      --   function()
      --     Snacks.picker.lsp_implementations()
      --   end,
      --   desc = 'Goto Implementation',
      -- },
      -- {
      --   'gy',
      --   function()
      --     Snacks.picker.lsp_type_definitions()
      --   end,
      --   desc = 'Goto T[y]pe Definition',
      -- },
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
    opts = {
      bigfile = {
        enabled = true,
      },
      picker = {
        enabled = true,
      },
      dashboard = {
        enabled = true,
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
          { section = 'startup' },
        },
      },
    },
  },
}
