local config = function()
  local utils = require('utils')
  local buffer_maps = require('plugins.mini-files.maps.buffer')
  local marks = require('plugins.mini-files.marks')

  require('mini.files').setup({
    content = {
      filter = require('plugins.mini-files.filter'),
      prefix = require('plugins.mini-files.prefix'),
    },
  })

  require('plugins.mini-files.maps.global').setup()

  utils.autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      buffer_maps.setup(args.data.buf_id)
    end,
  })

  utils.autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      marks.setup()
    end,
  })

  utils.autocmd('User', {
    pattern = 'MiniFilesActionRename',
    callback = function(event)
      Snacks.rename.on_rename_file(event.data.from, event.data.to)
    end,
  })
end

return {
  'nvim-mini/mini.files',
  config = config,
  version = false,
  keys = {
    { '-', nil, desc = 'Open mini.files in current file' },
    { '<leader>-', nil, desc = 'Open mini.files in last used path' },
    { '<leader>_', nil, desc = 'Open mini.files in root path of workspace' },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '^0.4.2' },
    -- { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
  },
}
