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

(unknown_builtin_statement
  (unknown_command_name) @_command
  (#eq? @_command "s")
  (arguments
    (command_argument) @injection.content)
  (#lua-match? @injection.content "<%S+>")
  (#is-nvim-config-file? "lua/maps/text.lua")
  (#set! injection.language "vim_map_side"))

; NOTE: can be removed if ast-grep is used instead
(unknown_builtin_statement
  (unknown_command_name) @_command
  (#eq? @_command "vimgrep")
  (arguments
    (command_argument) @injection.content)
  (#lua-match? @injection.content "<%S+>")
  (#is-nvim-config-file? "lua/maps/text.lua")
  (#set! injection.language "vim_map_side"))

(unknown_builtin_statement
  (unknown_command_name) @_command
  (#eq? @_command "cdo")
  (arguments
    (command_argument) @injection.content)
  (#lua-match? @injection.content "^%%s")
  (#is-nvim-config-file? "lua/maps/text.lua")
  (#offset! @injection.content 0 1 0 0)
  (#set! injection.language "vim"))
