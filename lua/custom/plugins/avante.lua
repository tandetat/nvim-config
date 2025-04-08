return {
  {
    'yetone/avante.nvim',
    enabled = false,
    -- event = 'VeryLazy',
    ft = {
      'zsh',
      'python',
      'go',
      'cpp',
      'c',
      'rust',
      'javascript',
      'javascriptreact',
      'sql',
      'typescript',
      'typescriptreact',
      'lua',
      'bash',
      'make',
      'fish',
      'tex',
      'markdown',
    },
    version = false, -- set this if you want to always pull the latest change
    opts = {
      debug = true,
      provider = 'ollama',
      cursor_applying_provider = 'ollama', -- In this example, use Groq for applying, but you can also use any provider you want.
      behaviour = {
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
      },
      ollama = {
        api_key_name = '',
        endpoint = 'http://127.0.0.1:11434',
        model = 'qwen2.5-coder:7b',
        -- model = 'deepseek-r1:8b',
        stream = true,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      -- 'nvim-tree/nvim-web-devicons'
      'echasnovski/mini.icons',
      'nvim-telescope/telescope.nvim',
      -- 'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        ft = { 'markdown', 'tex', 'avante' },
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  },
}
