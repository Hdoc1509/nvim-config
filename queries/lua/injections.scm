; extends

; utils
(function_call
  name: (_) @_fn
  (#any-of? @_fn "autocmd" "utils.autocmd" "require('utils').autocmd")
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
  name: (_) @_fn
  (#any-of? @_fn "autocmd" "utils.autocmd" "require('utils').autocmd")
  (arguments
    (table_constructor
      (field
        (identifier) @field
        (#eq? @field "command")
        value: (string
          (string_content) @injection.content)
        (#set! injection.language "vim")))))

; linter pattern events. lua/plugins/lint/init.lua:13
(variable_declaration
  (assignment_statement
    (variable_list
      name: (identifier) @_id)
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
              ]))))))
  (#eq? @_id "linter_patterns")
  (#is-nvim-config-file? "lua/plugins/lint/init.lua")
  (#set! injection.language "gitignore"))

((function_call
  name: (_) @_fn
  arguments: (arguments
    (binary_expression
      left: (string
        content: _ @injection.content))))
  (#set! injection.language "vim")
  (#any-of? @_fn "vim.cmd" "vim.api.nvim_command" "vim.api.nvim_command" "vim.api.nvim_exec2"))

; lazy spec: lhs
(chunk
  (return_statement
    (expression_list
      (table_constructor
        [
          ; single plugin
          (field
            name: (identifier) @_field
            value: (table_constructor
              (field
                value: [
                  ; lhs
                  (table_constructor
                    .
                    (field
                      value: (string
                        content: (string_content) @injection.content)))
                  ; rhs
                  (table_constructor
                    .
                    (_) ; -- lhs --
                    .
                    (field
                      value: (string
                        (string_content) @injection.content)))
                ])))
          ; plugins list
          (field
            value: (table_constructor
              (field
                name: (identifier) @_field
                value: (table_constructor
                  (field
                    value: (table_constructor
                      .
                      (field
                        value: (string
                          (string_content) @injection.content))))))))
        ])))
  (#eq? @_field "keys")
  (#lua-match? @injection.content "<%S+>")
  (#is-lazy-config-file? "")
  (#set! injection.language "vim_map_side"))

; lazy spec: colon rhs without keycode
(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_field
          value: (table_constructor
            (field
              value: (table_constructor
                .
                (_) ; -- lhs --
                .
                (field
                  value: (string
                    content: (string_content) @injection.content)))))))))
  (#is-lazy-config-file? "")
  (#eq? @_field "keys")
  (#lua-match? @injection.content "^:")
  (#not-lua-match? @injection.content "<cr>")
  (#set! injection.language "vim"))

(chunk
  (return_statement
    (expression_list
      (table_constructor
        [
          (field
            name: (identifier) @_build
            value: (string
              (string_content) @injection.content))
          (field
            value: (table_constructor
              (field
                name: (identifier) @_build
                value: (string
                  (string_content) @injection.content))))
        ])))
  (#eq? @_build "build")
  (#lua-match? @injection.content "^[^:]")
  (#is-lazy-config-file? "")
  (#set! injection.language "bash"))

(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_build
          value: (string
            (string_content) @injection.content)))))
  (#eq? @_build "build")
  (#lua-match? @injection.content "^:")
  (#is-lazy-config-file? "")
  (#set! injection.language "vim"))

(function_call
  name: (_) @_fn
  ; format-ignore
  arguments: (arguments
    . (_) ; -- line --
    . (_) ; -- mode --
    .
    (string
      (string_content) @injection.content))
  (#eq? @_fn "helper.find")
  (#is-nvim-config-file? "lua/plugins/gx.lua")
  (#set! injection.language "luap"))

(function_call
  name: (method_index_expression
    method: (identifier) @_fn)
  arguments: (arguments
    (binary_expression
      (string
        (string_content) @injection.content)))
  (#eq? @_fn "match")
  (#set! injection.language "luap"))

; === nmap: lhs (concatenated strings) ===
(function_call
  name: (_) @_fn
  arguments: (arguments
    .
    (binary_expression
      (string
        (string_content) @injection.content)))
  (#is-modemap-fn? @_fn)
  (#lua-match? @injection.content "<%S+>")
  (#set! injection.language "vim_map_side"))
