return {
  {
    'yetone/avante.nvim',
    enabled = true,
    version = false, -- Never set this value to "*"! Never!
    keys = { '<leader>a', '<cmd>AvanteToggle<cr>' },
    opts = {
      debug = true,
      provider = 'claude',
      providers = {
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-sonnet-4-20250514',
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
      selector = {
        provider = 'snacks',
        -- Options override for custom providers
        provider_opts = {},
      },
      input = {
        provider = 'snacks',
        provider_opts = {
          -- Additional snacks.input options
          title = 'Avante Input',
          icon = ' ',
        },
      },
      -- provider = 'ollama',
      -- providers = {
      --   ollama = {
      --     api_key_name = '',
      --     endpoint = 'http://127.0.0.1:11434',
      --     model = 'qwen3:latest',
      --     -- model = 'deepseek-r1:8b',
      --     stream = true,
      --   },
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      -- 'nvim-tree/nvim-web-devicons'
      'echasnovski/mini.icons',
      'folke/snacks.nvim',
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
