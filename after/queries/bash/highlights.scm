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
