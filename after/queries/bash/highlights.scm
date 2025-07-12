; extends

(command
  (command_name) @_command
  (#eq? @_command "command_snippet")
  .
  (string
    (string_content) @command_snippet_name)
  .
  (string
    (string_content) @command_snippet_args))

(command
  (command_name) @_info_log
  (#eq? @_info_log "info_log")
  .
  (string
    (string_content) @info_log_message))

(command
  (command_name) @_success_log
  (#eq? @_success_log "success_log")
  .
  (string
    (string_content) @success_log_message))

(command
  (command_name) @_error_log
  (#eq? @_error_log "error_log")
  .
  (string
    (string_content) @error_log_message))

(command
  (command_name) @_warn_log
  (#eq? @_warn_log "warn_log")
  .
  (string
    (string_content) @warn_log_message))
