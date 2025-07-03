; extends

(block_mapping_pair
  key: (flow_node)
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#lua-match? @injection.content "^${{.*}}$")
    (#offset! @injection.content 0 3 0 -2)
    (#set! injection.language "javascript")))

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
