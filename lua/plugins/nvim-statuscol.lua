local config = function()
  local builtin = require('statuscol.builtin')

  require('statuscol').setup({
    relculright = true,
    segments = {
      { text = { '%s' }, click = 'v:lua.ScSa' },
      { text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
      { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
    },
  })
end

return {
  'luukvbaal/statuscol.nvim',
  config = config,
  -- NOTE: until update to nvim-0.10
  commit = '2cdad94d0bdd7e56b9333d4e215bf5b05ba5ec1a',
}
