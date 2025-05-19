return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      -- lint.linters_by_ft = {
      --   markdown = { 'markdownlint' },
      -- }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        python = { 'ruff' },
        --
        -- However, note that this will enable a set of default linters,
        -- which will cause errors unless these tools are available:
        -- {
        --   clojure = { "clj-kondo" },
        --   dockerfile = { "hadolint" },
        --   inko = { "inko" },
        --   janet = { "janet" },
        --   json = { "jsonlint" },
        --   markdown = { "vale" },
        --   rst = { "vale" },
        --   ruby = { "ruby" },
        --   terraform = { "tflint" },
        --   text = { "vale" }
        -- }
        --
        -- You can disable the default linters by setting their filetypes to nil:
        clojure = {},
        dockerfile = {},
        inko = {},
        janet = {},
        json = {},
        rst = { 'clippy' },
        ruby = {},
        terraform = {},
        text = {},
        fish = { 'fish' },
      }
      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
