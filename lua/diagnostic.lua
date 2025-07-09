local lsp_util = require('vim.lsp.util')
local signs = require('icons').diagnostics
local base_popup_opts = lsp_util.make_floating_popup_options

-- Change diagnostic signs
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  float = { source = 'always', border = 'rounded' },
})

-- prevent lightiline.vim from breaking when opening a floating window with:
-- - vim.diagnostic.goto_next()
-- - vim.diagnostic.goto_prev()
-- - vim.lsp.buf.hover()
-- https://github.com/itchyny/lightline.vim/pull/659#issuecomment-1704032081
---@diagnostic disable-next-line: duplicate-set-field
lsp_util.make_floating_popup_options = function(width, height, opts)
  local base_opts = base_popup_opts(width, height, opts)
  base_opts.noautocmd = true
  return base_opts
end
