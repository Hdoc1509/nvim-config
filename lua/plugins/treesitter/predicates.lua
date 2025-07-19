-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

---@type treesitter.Directive[]
return {
  {
    name = 'is-conf-file?',
    callback = function(_, _, bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local extension = vim.fn.fnamemodify(filename, ':e')

      return extension == 'conf'
    end,
  },
}
