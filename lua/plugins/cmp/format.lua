local lspkind = require('lspkind')

return lspkind.cmp_format({
  mode = 'symbol_text',
  maxwidth = 50,
  symbol_map = { Supermaven = '' },
  menu = {
    nvim_lsp = '[LSP]',
    -- vsnip = '[Snippet]',
    path = '[Path]',
    buffer = '[Buffer]',
    supermaven = '[SuperMaven]',
    calc = '[Math]',
    nvim_lsp_document_symbol = '[Symbol]',
  },
  before = function(entry, item)
    if entry.source.name == 'calc' then
      item.kind = ''
    end

    return item
  end,
})
