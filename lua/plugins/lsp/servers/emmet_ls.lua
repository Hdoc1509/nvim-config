return {
  root_dir = function()
    return vim.loop.cwd()
  end,
  filetypes = vim.fn.extendnew(require('lspconfig').emmet_ls.config_def.filetypes, {
    'ejs',
  }),
}
