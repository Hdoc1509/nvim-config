return {
  'brenoprata10/nvim-highlight-colors',
  opts = {
    exclude_filetypes = { 'lazy' },
    enable_ansi = true,
    custom_colors = {
      -- light/bright colors from:
      -- https://github.com/Hdoc1509/dotfiles/tree/master/wezterm/colors.lua
      -- TODO: move colors to colors.lua
      { label = '033%[1;31m', color = '#fe0100' },
      { label = '033%[1;32m', color = '#29cc00' },
      { label = '033%[1;33m', color = '#feff00' },
      { label = '033%[1;34m', color = '#0066ff' },
      { label = '033%[1;35m', color = '#cc00ff' },
      { label = '033%[1;36m', color = '#00d5d5' },
    },
  },
}
