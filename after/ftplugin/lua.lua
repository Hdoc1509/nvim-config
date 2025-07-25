require('nvim-surround').buffer_setup({
  surrounds = {
    F = {
      add = function()
        local config = require('nvim-surround.config')
        local result = config.get_input('Enter the function name: ')

        if result ~= nil then
          return { { 'local function ' .. result .. '()' }, { ' end' } }
        end
      end,
    },
  },
})
