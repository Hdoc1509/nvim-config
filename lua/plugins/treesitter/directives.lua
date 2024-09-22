local ext_to_parser = require('plugins.treesitter.ext-to-parser')

return {
  -- https://github.com/nvim-treesitter/nvim-treesitter/discussions/1917#discussioncomment-10714144
  ['inject-ejs-tmpl!'] = function(_, _, bufnr, _, metadata)
    local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
    -- files ending in .{ext}.ejs
    local _, _, ext, _ = string.find(fname, '.*%.(%a+)(%.%a+)')

    metadata['injection.language'] = ext_to_parser[ext] or ext
  end,
}
