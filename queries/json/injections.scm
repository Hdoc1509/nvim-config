; extends

(document
  (object
    (pair
      key: (string
        (string_content) @_key
        (#eq? @_key "scripts"))
      value: (object
        (pair
          value: (string
            (string_content) @injection.content
            (#set! injection.language "bash")))))))

(document
  (object
    (pair
      key: (string
        (string_content) @_files
        (#eq? @_files "files"))
      value: (array
        (string
          (string_content) @injection.content
          (#set! injection.language "gitignore"))))))

(pair
  key: (string
    (string_content) @_wireit
    (#eq? @_wireit "wireit"))
  value: (object
    (pair
      value: (object
        [
          (pair
            key: (string
              (string_content) @_command
              (#eq? @_command "command"))
            value: (string
              (string_content) @injection.content))
          (pair
            key: (string
              (string_content) @_dependencies
              (#eq? @_dependencies "dependencies"))
            value: (array
              (string
                (string_content) @injection.content)))
        ]
        (#set! injection.language "bash")))))

(pair
  key: (string
    (string_content) @_wireit
    (#eq? @_wireit "wireit"))
  value: (object
    (pair
      value: (object
        (pair
          key: (string
            (string_content) @_files
            (#eq? @_files "files"))
          value: (array
            (string
              (string_content) @injection.content
              (#set! injection.language "gitignore"))))))))

; TODO: add bash injections to string values of fabric.mod.json if has "${"
; include surrounding quotes
