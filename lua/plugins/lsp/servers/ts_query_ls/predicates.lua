return {
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
    description = 'Match a `lua-pattern` against the text corresponding to a node.',
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
  ['is-nvim-config-file'] = {
    parameters = {
      { type = 'string', arity = 'optional' },
    },
    -- description = "Checks if file is in neovim's config directory",
    description = table.concat({
      "Checks if file path is in neovim's config directory, relative to it.",
      'If no path is provided, it will check if the file is in the config directory.\n',
      'Example:',
      '```query',
      '(#is-nvim-config-file? "")',
      '; or',
      '(#is-nvim-config-file? "lua/maps/init.lua")',
      '```',
    }, '\n'),
  },
  ['is-lazy-config-file'] = {
    parameters = {
      { type = 'string', arity = 'optional' },
    },
    description = "Checks if file is a lazy.nvim config file in neovim's config directory",
  },
  ['is-linter-config-file'] = {
    parameters = {
      { type = 'string', arity = 'optional' },
    },
    description = "Checks if file is a linter config file in neovim's config directory",
  },
}
