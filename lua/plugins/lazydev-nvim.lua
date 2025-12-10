return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      -- TODO: try "DrKJeff16/wezterm-types"
      -- { path = "wezterm-types", mods = { "wezterm" } }
    },
  },
}
