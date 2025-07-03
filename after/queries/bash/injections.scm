; extends

((comment) @_parser
  .
  (#lua-match? @_parser "inject:(%a+):")
  (variable_assignment
    value: (raw_string) @injection.content
    (#inject-from-comment! @_parser)))
