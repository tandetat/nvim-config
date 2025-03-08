return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Add buffer to Harpoon' })
      vim.keymap.set('n', '<leader>hm', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Open Harpoon quick menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Open 1st buffer stored in Harpoon' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Open 2nd buffer stored in Harpoon' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Open 3rd buffer stored in Harpoon' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Open 4th buffer stored in Harpoon' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<leader>p', function()
        harpoon:list():prev()
      end, { desc = 'Open previous buffer stored in Harpoon' })
      vim.keymap.set('n', '<leader>n', function()
        harpoon:list():next()
      end, { desc = 'Open next buffer stored in Harpoon' })
      vim.keymap.set('n', '<leader>mr', function()
        harpoon:list():remove()
      end, { desc = 'Remove item in Harpoon' })
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  },
}
