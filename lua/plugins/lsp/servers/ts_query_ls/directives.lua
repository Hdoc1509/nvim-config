return {
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
  ['inject-vim-mapping-cmd'] = {
    parameters = {
      {
        type = 'capture',
        arity = 'required',
        description = '`(string_content)` node from `lua` parser',
      },
    },
    description = 'Injects vim parser in lua mappings for vim commands.',
  },
}
