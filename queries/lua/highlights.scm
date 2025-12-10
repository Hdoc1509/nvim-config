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
        name: (_) @_fn
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
    method: (identifier) @_fn)
  arguments: (arguments
    (binary_expression
      (string
        (string_content) @string.regexp)))
  (#eq? @_fn "match"))

(function_call
  name: (_) @_fn
  arguments: [
    (arguments
      .
      (string
        (string_content) @constant))
    (arguments
      .
      (table_constructor
        (field
          (string
            (string_content) @constant))))
  ]
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

(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_cmd
          value: (string
            (string_content) @function.call)))))
  (#eq? @_cmd "cmd")
  (#is-linter-config-file? ""))

(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_args
          value: (table_constructor
            (field
              (string
                (string_content) @variable.parameter)))))))
  (#eq? @_args "args")
  (#is-linter-config-file? ""))

(field
  name: (identifier) @_highlight
  value: (table_constructor
    (field
      value: (string
        (string_content) @type)))
  (#eq? @_highlight "highlight")
  (#is-nvim-config-file? "lua/plugins/indent-blankline.lua"))

((string
  (string_content) @string.special.url)
  (#lua-match? @string.special.url "^https?://%S+$")
  (#is-nvim-config-file? "lua/plugins/gx.lua"))

; === vim.fn['function'] ===
(function_call
  name: (bracket_index_expression
    table: (_) @_fn
    field: (string
      (string_content) @function))
  (#eq? @_fn "vim.fn"))

; === lightline.component_function ===
(field
  name: (_) @_component_function
  value: (table_constructor
    (field
      value: (string
        (string_content) @function)))
  (#eq? @_component_function "component_function")
  (#is-nvim-config-file? "lua/plugins/lightline.lua"))

; === formatter.nvim ===
((function_definition
  .
  (parameters)
  .
  body: (block
    (return_statement
      (expression_list
        (table_constructor
          (field
            name: (_) @_exe
            value: (string
              (string_content) @function.call)))))))
  (#eq? @_exe "exe")
  (#is-nvim-config-file? "lua/plugins/formatter.lua"))

((function_definition
  .
  (parameters)
  .
  body: (block
    (return_statement
      (expression_list
        (table_constructor
          (field
            name: (_) @_args
            value: (table_constructor
              (field
                value: (string
                  (string_content) @variable.parameter)))))))))
  (#eq? @_args "args")
  (#is-nvim-config-file? "lua/plugins/formatter.lua"))

; === vim-map-side.tree-sitter setup ===
(field
  name: (_) @_custom_fns
  value: (table_constructor
    (field
      value: (table_constructor
        (field
          value: (string
            (string_content) @function)))))
  (#eq? @_custom_fns "custom_fns")
  (#not-lua-match? @function "%.")
  (#is-nvim-config-file? "lua/plugins/treesitter/init.lua"))

; === global `vim` table ===
(dot_index_expression
  table: (_) @variable.builtin
  (#eq? @variable.builtin "vim"))
