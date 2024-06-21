return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup({
      keymaps = {
        accept_suggestion = '<C-a>',
        clear_suggestion = '<C-q>',
      },
    })
  end,
}
