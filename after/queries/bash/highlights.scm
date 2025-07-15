; extends

(command
  (command_name) @_command
  (#eq? @_command "command_snippet")
  .
  (string
    (string_content) @function)
  .
  (string
    (string_content) @variable.parameter))

(command
  (command_name) @_info_log
  (#eq? @_info_log "info_log")
  .
  (string
    (string_content) @function))

(command
  (command_name) @_error_log
  (#eq? @_error_log "error_log")
  .
  (string
    (string_content) @function.builtin))

(command
  (command_name) @_warn_log
  (#eq? @_warn_log "warn_log")
  .
  (string
    (string_content) @diagnostic.warn))

(command
  (command_name
    (concatenation
      (word) @variable.parameter
      (#lua-match? @variable.parameter "^%-%-[%a%-]+=$")
      (#is-conf-file? ""))))

(command
  (command_name
    (word) @variable.parameter
    (#lua-match? @variable.parameter "^%-%-[%a%-]+$")
    (#is-conf-file? "")))

(variable_assignment
  (variable_name) @variable.parameter
  (#lua-match? @variable.parameter "^%-%-[%a%-]+$")
  (#is-conf-file? ""))

((variable_assignment
  "=" @variable.parameter
  (#is-conf-file? "")) @_assignment
  (#lua-match? @_assignment "^%-%-[%a%-]+=.+"))
