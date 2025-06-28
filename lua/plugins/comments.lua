local config = function()
  ---@diagnostic disable-next-line: missing-fields
  require('Comment').setup({
    toggler = {
      line = '<Leader>cc',
      block = '<Leader>bb',
    },
    opleader = {
      line = '<Leader>c',
      block = '<Leader>b',
    },
    extra = {
      above = '<Leader>cO',
      below = '<Leader>co',
      eol = '<Leader>cA',
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = config,
}
