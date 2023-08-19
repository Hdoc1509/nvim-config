return {
  'Exafunction/codeium.vim',
  config = function()
    local utils = require('utils')
    local keymap = utils.keymap
    local merge = utils.merge

    vim.g.codeium_disabled_bindings = 1
    vim.g.codeium_no_map_tab = 1

    local imap_expr = function(lhs, rhs, opts)
      keymap('i', lhs, rhs, merge({ expr = true }, opts or {}))
    end

    -- stylua: ignore start
    imap_expr('<C-a>', function() return vim.fn['codeium#Accept']() end)
    imap_expr('<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end)
    imap_expr('<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end)
    imap_expr('<C-q>', function() return vim.fn['codeium#Clear']() end)
    -- stylua: ignore end
  end,
  event = 'BufEnter',
}
