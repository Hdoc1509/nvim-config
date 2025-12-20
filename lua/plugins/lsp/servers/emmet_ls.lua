return {
  root_dir = function()
    return vim.uv.cwd()
  end,
  filetypes = vim.fn.extendnew(vim.lsp.config.emmet_ls.filetypes, {
    'ejs',
  }),
}
