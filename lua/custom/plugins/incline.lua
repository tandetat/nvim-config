return {
  {
    'b0o/incline.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
    },
    config = function()
      local navic = require 'nvim-navic'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          -- Get the colors for the current theme
          local colors = require('kanagawa-paper.colors').setup()
          local theme_colors = colors.theme
          local res = {
            guibg = theme_colors.ui.bg_statusline,
          }
          if props.focused then
            for i, item in ipairs(navic.get_data(props.buf) or {}) do
              if i == 1 then
                table.insert(res, {
                  { item.icon, group = 'NavicIcons' .. item.type },
                  { item.name, group = 'NavicText' },
                })
              else
                table.insert(res, {
                  { ' > ', group = 'NavicSeparator' },
                  { item.icon, group = 'NavicIcons' .. item.type },
                  { item.name, group = 'NavicText' },
                })
              end
            end
          end
          table.insert(res, ' ')
          return res
        end,
      }
    end,
  },
}
