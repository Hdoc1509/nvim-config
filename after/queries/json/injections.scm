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
