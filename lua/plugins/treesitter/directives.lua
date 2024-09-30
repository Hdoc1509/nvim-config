local ext_to_parser = require('plugins.treesitter.ext-to-parser')

--- @class Directive
--- @field name string
--- @field callback function
--- @field opts? boolean

-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

--- @type Directive[]
return {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter/discussions/1917#discussioncomment-10714144
    name = 'inject-ejs-tmpl!',
    callback = function(_, _, bufnr, _, metadata)
      local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
      -- files ending in .{ext}.ejs
      local _, _, ext, _ = string.find(fname, '.*%.(%a+)(%.%a+)')

      metadata['injection.language'] = ext_to_parser[ext] or ext
    end,
  },
}
