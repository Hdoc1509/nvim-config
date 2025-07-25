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
}
