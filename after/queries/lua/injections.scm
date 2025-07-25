; extends

; utils
(function_call
  name: [
    (identifier)
    (dot_index_expression)
  ] @function
  (#any-of? @function "autocmd" "utils.autocmd" "require('utils').autocmd")
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
        (#set! injection.language "gitignore")))))

(function_call
  name: [
    (identifier)
    (dot_index_expression)
  ] @function
  (#any-of? @function "autocmd" "utils.autocmd" "require('utils').autocmd")
  (arguments
    (table_constructor
      (field
        (identifier) @field
        (#eq? @field "command")
        value: (string
          (string_content) @injection.content)
        (#set! injection.language "vim")))))

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
              (#set! injection.language "gitignore"))))))))
