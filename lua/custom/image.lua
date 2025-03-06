return {
  {
    '3rd/image.nvim',
    -- build = false,
    opts = {
      integrations = {
        markdown = {
          clear_in_insert_mode = true,
          only_render_image_at_cursor = false,
        },
      },
    },
  },
}
