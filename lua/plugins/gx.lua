local function config()
  local helper = require('gx.helper')

  ---@type table<string, boolean|GxHandler>
  local handlers = {
    shellcheck = {
      name = 'shellcheck',
      handle = function(mode, line, _)
        local code = helper.find(line, mode, 'shellcheck:.+%[(SC%d+)%]')

        if code ~= nil then
          return 'https://www.shellcheck.net/wiki/' .. code
        end
      end,
    },
  }

  ---@diagnostic disable-next-line: missing-fields
  require('gx').setup({ handlers = handlers })
end

return {
  'chrishrb/gx.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } },
  },
  cmd = { 'Browse' },
  init = function()
    vim.g.netrw_nogx = 1
  end,
  submodules = false,
  config = config,
}
