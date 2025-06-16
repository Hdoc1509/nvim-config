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
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
