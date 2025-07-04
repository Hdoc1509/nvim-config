; extends

; TODO: inject `regex` pattern to <pattern>
; - uses: actions/upload-artifact*
;   with:
;     path: <pattern>
; - uses: tj-actions/changed-files@v44
;   with:
;     files: |
;       <pattern>
;       <pattern>
;
(block_mapping_pair
  value: (flow_node
    [
      (plain_scalar
        (string_scalar) @injection.content)
      (double_quote_scalar) @injection.content
    ]
    (#lua-match? @injection.content "${{")
    (#set! injection.language "githubactions")))

(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#lua-match? @injection.content "${{")
    (#set! injection.language "githubactions")))

(block_mapping_pair
  key: (flow_node) @_key
  (#eq? @_key "if")
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#set! injection.language "githubactions")))

(block_mapping_pair
  key: (flow_node) @_key
  (#any-of? @_key "branches" "paths")
  value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node
          [
            (double_quote_scalar) @injection.content
            (plain_scalar
              (string_scalar) @injection.content)
          ])))
    (#set! injection.language "regex")))

(block_mapping_pair
  key: (flow_node) @_on
  (#eq? @_on "on")
  value: (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_push
        (#eq? @_push "push")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_tags
              (#eq? @_tags "tags")
              value: (flow_node
                (flow_sequence
                  (flow_node
                    (double_quote_scalar) @injection.content))
                (#set! injection.language "regex")))))))))
