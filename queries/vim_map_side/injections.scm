((command) @injection.content
  (#set! injection.language "vim"))

(printf
  (string
    (string_content) @injection.content)
  (#set! injection.language "printf"))
