local M = {}

M.spec = {
  'mistweaverco/kulala.nvim',
  ft = { 'http', 'rest' },

  init = function()
    vim.filetype.add {
      extension = {
        http = 'http',
        rest = 'http',
      },
    }
  end,

  opts = {
    global_keymaps = false,
    global_keymaps_prefix = '<leader>R',
    kulala_keymaps_prefix = '',
  },

  config = function(_, opts)
    local ok, kulala = pcall(require, 'kulala')
    if not ok then
      vim.notify('[kulala.nvim] failed to load', vim.log.levels.ERROR)
      return
    end
    kulala.setup(opts)

    -- custom keymaps
    vim.keymap.set('n', '<leader>rs', function()
      require('kulala').run()
    end, {
      desc = 'Send request under cursor',
      noremap = true,
      silent = true,
    })

    vim.keymap.set('n', '<leader>ra', function()
      require('kulala').run_all()
    end, {
      desc = 'Send all requests in file',
      noremap = true,
      silent = true,
    })

    vim.keymap.set('n', '<leader>rb', function()
      require('kulala').open_scratchpad()
    end, { desc = 'Open kulala scratchpad', noremap = true, silent = true })
  end,
}

return M.spec
