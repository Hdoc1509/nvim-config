return {
  handlers = {
    -- based on:
    -- https://github.com/neovim/nvim-lspconfig/commit/7e585e3f37bcf46761adf5e76dd343fb2d8e6670
    ['actions/readFile'] = function(_, result)
      if type(result.path) ~= 'string' then
        return nil, nil
      end

      local file_path = vim.uri_to_fname(result.path)

      if vim.fn.filereadable(file_path) == 1 then
        local f = assert(io.open(file_path, 'r'))
        local text = f:read('*a')
        f:close()

        return text, nil
      end

      return nil, nil
    end,
  },
  init_options = {
    sessionToken = vim.env.GITHUB_ACTIONS_LS_TOKEN,
    repos = {},
  },
}
