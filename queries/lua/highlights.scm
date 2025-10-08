; extends

; TODO: add the same highlight to events lists in lint/init.lua
(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_field
          value: [
            (string
              content: (string_content) @constant)
            (table_constructor
              (field
                value: (string
                  content: (string_content) @constant)))
          ]))))
  (#is-lazy-config-file? "")
  (#eq? @_field "event"))

(function_call
  name: (method_index_expression
    method: (identifier) @_match)
  arguments: (arguments
    (binary_expression
      (string
        (string_content) @string.regexp)))
  (#eq? @_match "match"))

(function_call
  name: [
    (identifier)
    (dot_index_expression)
  ] @_fn
  arguments: (arguments
    .
    (string
      (string_content) @constant))
  (#any-of? @_fn "autocmd" "utils.autocmd" "require('utils').autocmd")
  (#is-nvim-config-file? ""))

(chunk
  (return_statement
    (expression_list
      (table_constructor
        [
          (field
            name: (identifier) @_field
            value: [
              (string
                (string_content) @function.macro)
              (table_constructor
                (field
                  value: (string
                    (string_content) @function.macro)))
            ])
          (field
            value: (table_constructor
              (field
                name: (identifier) @_field
                value: [
                  (string
                    (string_content) @function.macro)
                  (table_constructor
                    (field
                      value: (string
                        (string_content) @function.macro)))
                ])))
        ])))
  (#eq? @_field "cmd")
  (#is-lazy-config-file? ""))
