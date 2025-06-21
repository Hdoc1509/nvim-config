local config = function()
  local nvim_notify = require('notify')

  nvim_notify.setup({
    timeout = 2000,
  })

  vim.notify = nvim_notify
end

return {
  'rcarriga/nvim-notify',
  config = config,
  -- NOTE: until update to nvim-0.10
  commit = '29b33efc802a304b1cf13ab200915d4e9e67373d',
}
