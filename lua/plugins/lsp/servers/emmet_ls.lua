return {
  root_dir = function()
    return vim.uv.cwd()
  end,
  -- TODO: extend instead of overwrite
  filetypes = {
    'astro',
    'css',
    'ejs',
    'html',
    'javascriptreact',
    'scss',
    'typescriptreact',
  },
}
