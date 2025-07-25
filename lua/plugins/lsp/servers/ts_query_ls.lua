local default_settings = require('plugins.lsp.servers._default_settings')

-- TODO: split into
-- ./init.lua
-- ./predicates.lua
-- ./directives.lua
return require('utils').merge(default_settings, {
  settings = {
    parser_install_directories = {
      vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/parser/',
    },
    valid_predicates = {
      eq = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'any', arity = 'required' },
        },
        description = 'Checks for equality between two nodes, or a node and a string.',
      },
      match = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'string', arity = 'required' },
        },
        description = 'Match a `regexp` against the text corresponding to a node.',
      },
      ['vim-match'] = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'string', arity = 'required' },
        },
        description = 'Match a `regexp` against the text corresponding to a node.',
      },
      ['lua-match'] = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'string', arity = 'required' },
        },
        description = 'Match a `lua-pattern` against the text corresponding to a node. hahaha',
      },
      contains = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'string', arity = 'required' },
          { type = 'string', arity = 'variadic' },
        },
        description = 'Match a string against parts of the text corresponding to a node.',
      },
      ['any-of'] = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'string', arity = 'required' },
          { type = 'string', arity = 'variadic' },
        },
        description = 'Checks for equality between multiple strings haha',
      },
      ['is-conf-file'] = {
        parameters = {
          { type = 'string', arity = 'optional' },
        },
        description = 'Checks if file has `.conf` extension',
      },
    },
    valid_directives = {
      set = {
        parameters = {
          { type = 'any', arity = 'required' },
          { type = 'string', arity = 'variadic' },
        },
        description = 'Sets key/value metadata for a specific match or capture. Value is accessible as either `metadata[key]` (match specific) or `metadata[capture_id][key]` (capture specific).',
      },
      offset = {
        parameters = {
          { type = 'capture', arity = 'required' },
          { type = 'string', arity = 'required' },
          { type = 'string', arity = 'required' },
          { type = 'string', arity = 'required' },
          { type = 'string', arity = 'required' },
        },
        description = 'Takes the range of the capture and applies an offset. This will generate a new range object for the captured node as `metadata[capture_id].range`.',
      },
      ['inject-mdx-js'] = {
        parameters = {
          { type = 'string', arity = 'optional' },
        },
        description = 'Injects `javascript`. Only have effect in `mdx` files.',
      },
    },
  },
}, require('hygen.ts-query-ls'))
