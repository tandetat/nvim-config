return {
  {
    'saghen/blink.cmp',
    version = '*',
    -- event = 'InsertEnter',
    event = 'VimEnter',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'Kaiser-Yang/blink-cmp-avante',
      'folke/lazydev.nvim',
    },

    -- use a release tag to download pre-built binaries

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = { 'snippet_forward', 'fallback' },
        ['<Down>'] = { 'snippet_backward', 'fallback' },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
        accept = { auto_brackets = { enabled = true } },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      cmdline = {
        keymap = {
          ['<Tab>'] = { 'accept' },
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
        -- (optionally) automatically show the menu
        completion = { menu = { auto_show = true } },
      },
      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = {
          'avante',
          'lazydev',
          'lsp',
          'path',
          'snippets',
          'buffer',
          'markdown',
          'cmdline',
        },
        providers = {
          markdown = {
            name = 'RenderMarkdown',
            module = 'render-markdown.integ.blink',
            fallbacks = { 'lsp' },
          },
          cmdline = {
            min_keyword_length = function(ctx)
              -- when typing a command, only show when the keyword is 3 characters or longer
              if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                return 3
              end
              return 0
            end,
          },
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
          },
          lazydev = {
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      signature = { enabled = true },
      fuzzy = { implementation = 'lua' },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
  },
}
