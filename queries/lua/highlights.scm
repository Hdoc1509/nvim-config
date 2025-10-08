; extends

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

local_declaration: (variable_declaration
  (assignment_statement
    .
    (variable_list) @_events_ident
    (expression_list
      (table_constructor
        (field
          value: (string
            (string_content) @constant)))))
  (#eq? @_events_ident "normal_events")
  (#is-nvim-config-file? "lua/plugins/lint/init.lua"))

local_declaration: (variable_declaration
  (assignment_statement
    .
    (variable_list) @_events_ident
    (expression_list
      value: (function_call
        name: (dot_index_expression) @_fn
        arguments: (arguments
          (table_constructor
            (field
              value: (string
                (string_content) @constant)))))))
  (#eq? @_events_ident "aggressive_events")
  (#eq? @_fn "vim.fn.extendnew")
  (#is-nvim-config-file? "lua/plugins/lint/init.lua"))

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
