; extends

(let_statement
  .
  (identifier) @_commands
  (list
    (string_literal) @injection.content)
  (#eq? @_commands "commands")
  (#offset! @injection.content 0 1 0 -1)
  (#is-nvim-config-file? "ftplugin/markdown.vim")
  (#set! injection.language "vim"))

(silent_statement
  (execute_statement
    (binary_operation
      left: (argument
        (identifier) @_firstline)
      right: (string_literal) @injection.content))
  (#eq? @_firstline "firstline")
  (#offset! @injection.content 0 1 0 -1)
  (#is-nvim-config-file? "ftplugin/markdown.vim")
  (#set! injection.language "vim"))
