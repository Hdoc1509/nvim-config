; extends

; utils
(function_call
  (identifier) @function
  (#eq? @function "autocmd")
  (arguments
    (table_constructor
      (field
        (identifier) @field
        (#eq? @field "pattern")
        value: [
          (string
            (string_content) @injection.content)
          (table_constructor
            (field
              (string
                (string_content) @injection.content)))
        ]
        (#set! injection.language "regex")))))

; linter pattern events. lua/plugins/lint/init.lua:10
(variable_declaration
  (assignment_statement
    (variable_list
      name: (identifier) @_id
      (#lua-match? @_id "^linter_patterns$"))
    (expression_list
      value: (table_constructor
        (field
          value: (table_constructor
            (field
              value: [
                (string
                  (string_content) @injection.content)
                (table_constructor
                  (field
                    value: (string
                      (string_content) @injection.content)))
              ]
              (#set! injection.language "regex"))))))))
