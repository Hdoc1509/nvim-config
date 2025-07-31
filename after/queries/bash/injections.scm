; extends

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
  name: (command_name) @_awk
  (#eq? @_awk "awk")
  argument: (raw_string) @injection.content
  (#lua-match? @injection.content "^'{")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "awk"))

(command
  name: (command_name) @_sed
  (#eq? @_sed "sed")
  argument: (string
    (string_content) @injection.content
    (#not-lua-match? @injection.content "{{")
    (#set! injection.language "regex")))

(command
  name: (command_name) @_sed
  (#eq? @_sed "sed")
  argument: (raw_string) @injection.content
  (#not-lua-match? @injection.content "{{")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "regex"))

; TODO: add `regex` injection to `grep` command

(command
  name: (command_name) @_jq
  (#eq? @_jq "jq")
  argument: (raw_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "jq"))

(command
  name: (command_name) @_fzf_preview
  (#any-of? @_fzf_preview "__fzf_preview")
  .
  argument: (string)
  .
  argument: (string
    (string_content) @injection.content)
  (#set! injection.language "bash"))
