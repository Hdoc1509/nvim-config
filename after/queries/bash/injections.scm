; extends

; TODO: unify `inject-hygen-ejs!` injections
(command
  (string
    (string_content) @injection.content
    (#lua-match? @injection.content "<%%=")
    (#inject-hygen-ejs! "")))

(command
  (concatenation
    (string
      (string_content) @injection.content
      (#lua-match? @injection.content "<%%=")
      (#inject-hygen-ejs! ""))))

(variable_assignment
  (variable_name) @name
  (#lua-match? @name "_regex$")
  value: (raw_string) @injection.content
  (#set! injection.language "regex")
  (#offset! @injection.content 0 1 0 -1))

(command
  name: (command_name) @_command
  (#eq? @_command "awk")
  .
  argument: (raw_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "awk"))
