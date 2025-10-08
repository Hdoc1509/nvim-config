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
  name: (_) @_vimcmd_identifier
  arguments: (arguments
    (binary_expression
      left: (string
        content: _ @injection.content))))
  (#set! injection.language "vim")
  (#any-of? @_vimcmd_identifier
    "vim.cmd" "vim.api.nvim_command" "vim.api.nvim_command" "vim.api.nvim_exec2"))

(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_field
          value: (table_constructor
            (field
              value: (table_constructor
                (field
                  value: (string
                    content: (string_content) @injection.content)))))))))
  (#is-lazy-config-file? "")
  (#eq? @_field "keys")
  (#inject-vim-mapping-cmd! @injection.content))

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
  name: (method_index_expression
    method: (identifier) @_match)
  arguments: (arguments
    (binary_expression
      (string
        (string_content) @injection.content)))
  (#eq? @_match "match")
  (#set! injection.language "luap"))

(function_call
  name: (identifier) @_fn
  arguments: (arguments
    (string
      (string_content) @injection.content))
  (#any-of? @_fn "nmap" "buf_nmap")
  (#is-nvim-config-file? "")
  (#inject-vim-mapping-cmd! @injection.content))

(function_call
  name: (identifier) @_fn
  arguments: (arguments
    (string
      (string_content) @injection.content))
  (#eq? @_fn "keymap")
  (#lua-match? @injection.content "^y:%%s/")
  (#is-nvim-config-file? "lua/maps/text.lua")
  (#offset! @injection.content 0 3 0 0)
  (#set! injection.language "vim"))

(function_call
  name: (identifier) @_fn
  arguments: (arguments
    (string
      (string_content) @injection.content))
  (#eq? @_fn "keymap")
  (#lua-match? @injection.content "^y:vimgrep")
  (#is-nvim-config-file? "lua/maps/text.lua")
  (#offset! @injection.content 0 1 0 0)
  (#set! injection.language "vim"))
