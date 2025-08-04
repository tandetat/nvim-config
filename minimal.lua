vim.o.number = true
vim.o.relativenumber = true

local map = vim.keymap.set
local silent = { silent = true, noremap = true }

map('', '<Space>', '<Nop>', silent)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.termguicolors = true

vim.o.scrolloff = 10

vim.o.foldmethod = 'expr'

vim.cmd.set 'nofoldenable'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
vim.o.laststatus = 0
vim.opt.expandtab = true
vim.opt.softtabstop = -1

vim.pack.add {

  'https://github.com/thesimonho/kanagawa-paper.nvim',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/folke/snacks.nvim',
}

require('kanagawa-paper').setup {
  transparent = true,
  -- plugins = {
  --   mini = false,
  -- },
  integrations = {
    wezterm = {
      enabled = true,
      path = (os.getenv 'TEMP' or '/tmp') .. '/nvim-theme',
    },
  },
}

vim.cmd.colorscheme 'kanagawa-paper'

vim.lsp.config('lua_ls', {})
vim.lsp.config 'stylua'
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'stylua'
map('n', '<leader>f', vim.lsp.buf.format)
map('n', 'gd', vim.lsp.buf.declaration)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      -- vim.keymap.set({ 'n', 'i'}, "<leader>c", vim.lsp.completion.get, { desc = "trigger autocompletion" })
    end
  end,
})
vim.cmd 'set completeopt+=noselect'
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua' },
  -- Autoinstall languages that are not installed
  auto_install = true,
  highlight = {
    enable = true,
    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    disable = { 'latex' },
  },
  indent = { enable = true },
}
vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' then
      vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
      end
    end
  end,
})

-- [[Diagnostics]]
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  -- underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

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
}

-- [[LSP Progress bar]]
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= 'table' then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ('[%3d%%] %s%s'):format(
            value.kind == 'end' and 100 or value.percentage or 100,
            value.title or '',
            value.message and (' **%s**'):format(value.message) or ''
          ),
          done = value.kind == 'end',
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(table.concat(msg, '\n'), 'info', {
      id = 'lsp_progress',
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

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
}
for _, value in ipairs(snacks_keys) do
  map({ 'n', 'v' }, value[1], value[2], { noremap = false, silent = true, desc = value[3] })
end
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

-- vim: ts=2 sts=2 sw=2 et
