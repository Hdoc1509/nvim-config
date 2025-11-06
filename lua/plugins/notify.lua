return {
  'rcarriga/nvim-notify',
  config = function()
    local nvim_notify = require('notify')

    nvim_notify.setup({
      timeout = 2000,
      merge_duplicates = true, -- as default
    })

    vim.notify = nvim_notify
  end,
}
