return {
  'brenoprata10/nvim-highlight-colors',
  opts = {
    exclude_filetypes = { 'lazy' },
    enable_ansi = true,
    custom_colors = {
      -- light/bright colors from:
      -- https://github.com/Hdoc1509/dotfiles/tree/master/wezterm/colors.lua
      { label = '033%[1;31m', color = '#fe0100' },
      { label = '033%[1;32m', color = '#29cc00' },
      { label = '033%[1;33m', color = '#feff00' },
      { label = '033%[1;34m', color = '#0066ff' },
      { label = '033%[1;35m', color = '#cc00ff' },
      { label = '033%[1;36m', color = '#00d5d5' },
      -- based on: https://www.ditig.com/256-colors-cheat-sheet
      -- visual reference:
      -- https://camo.githubusercontent.com/bb6e49c14a1925e7cd3537b6958b3d935de7516591a79e17ad1547ca0cf79313/68747470733a2f2f67756e732e6769746875622e696f2f787465726d2d636f6c6f722d7461626c652e76696d2f696d616765732f787465726d2d636f6c6f722d7461626c652d776974682d76697369626c652d7267622e706e67
      -- closest to DiagnosticOk, String, @string
      { label = 'tput setaf 34', color = '#00af00' },
      -- closest to @variable.parameter
      { label = 'tput setaf 75', color = '#5fafff' },
      -- closest to DiagnosticInfo, Function, @function
      { label = 'tput setaf 111', color = '#87afff' },
      -- closest to DiagnosticWarn
      { label = 'tput setaf 141', color = '#af87ff' },
      -- closest to DiagnosticError, @function.builtin
      { label = 'tput setaf 198', color = '#ff0087' },
    },
  },
}
