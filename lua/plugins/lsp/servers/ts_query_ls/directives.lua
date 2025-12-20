return {
  set = {
    parameters = {
      { type = 'any', arity = 'required' },
      { type = 'string', arity = 'variadic' },
    },
    description = table.concat({
      'Sets key/value metadata for a specific match or capture.',
      'Value is accessible as either `metadata[key]` (match specific) or `metadata[capture_id][key]` (capture specific).',
    }, '\n'),
  },
  offset = {
    parameters = {
      { type = 'capture', arity = 'required' },
      { type = 'string', arity = 'required' },
      { type = 'string', arity = 'required' },
      { type = 'string', arity = 'required' },
      { type = 'string', arity = 'required' },
    },
    description = table.concat({
      'Takes the range of the capture and applies an offset.',
      'This will generate a new range object for the captured node as `metadata[capture_id].range`.',
    }, '\n'),
  },
  ['offset-gh-actions-on-push-pr'] = {
    parameters = {
      {
        type = 'capture',
        arity = 'required',
        description = 'node captured as `@injection.content`',
      },
    },
    description = table.concat({
      'Applies an offset to `single_quote_scalar` and `double_quote_scalar` nodes.',
      'Meant to be used for injections to `paths`, `branches` and `tags` of `push` and `pull_request` events.',
    }, '\n'),
  },
}
