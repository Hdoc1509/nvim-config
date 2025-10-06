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
