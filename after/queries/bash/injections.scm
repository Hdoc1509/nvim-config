; extends

(command
  (string
    (string_content) @injection.content
    (#lua-match? @injection.content "<%%=")
    (#inject-hygen-ejs!)))

(command
  (concatenation
    (string
      (string_content) @injection.content
      (#lua-match? @injection.content "<%%=")
      (#inject-hygen-ejs!))))

((comment) @_parser
  .
  (#lua-match? @_parser "inject:(%a+):")
  (variable_assignment
    value: (raw_string) @injection.content
    (#inject-from-comment! @_parser)))

(command
  name: (command_name) @_command
  (#eq? @_command "awk")
  .
  argument: (raw_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "awk"))
