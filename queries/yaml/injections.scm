; extends

(block_mapping_pair
  key: (flow_node) @_on
  (#eq? @_on "on")
  value: (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_event
        (#any-of? @_event "push" "pull_request")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_tags_paths_branches
              (#any-of? @_tags_paths_branches "tags" "paths" "branches")
              value: [
                (flow_node
                  (flow_sequence
                    (flow_node
                      [
                        (single_quote_scalar) @injection.content
                        (double_quote_scalar) @injection.content
                        (plain_scalar
                          (string_scalar) @injection.content)
                      ])))
                (block_node
                  (block_sequence
                    (block_sequence_item
                      (flow_node
                        [
                          (single_quote_scalar) @injection.content
                          (double_quote_scalar) @injection.content
                          (plain_scalar
                            (string_scalar) @injection.content)
                        ]))))
              ]))))))
  (#is-gh-actions-file? "")
  (#offset-gh-actions-on-push-pr! @injection.content)
  (#set! injection.language "gitignore"))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^tj%-actions/changed%-files"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_files
              (#eq? @_files "files")
              value: (block_node
                (block_scalar) @injection.content
                (#set! injection.language "gitignore")
                (#offset! @injection.content 0 1 0 0)))))))))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^actions/upload%-artifact"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_path
              (#eq? @_path "path")
              value: (block_node
                (block_scalar) @injection.content
                (#set! injection.language "gitignore")
                (#offset! @injection.content 0 1 0 0)))))))))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^actions/upload%-artifact"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_path
              (#eq? @_path "path")
              value: (flow_node
                (plain_scalar
                  (string_scalar) @injection.content)
                (#set! injection.language "gitignore")))))))))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^actions/upload%-pages%-artifact"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_path
              (#eq? @_path "path")
              value: (flow_node
                (plain_scalar
                  (string_scalar) @injection.content)
                (#set! injection.language "gitignore")))))))))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^Kir%-Antipov/mc%-publish"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_files
              (#eq? @_files "files")
              value: (block_node
                (block_scalar) @injection.content
                (#set! injection.language "gitignore")
                (#offset! @injection.content 0 1 0 0)))))))))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^Kir%-Antipov/mc%-publish"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_option
              (#any-of? @_option "files" "changelog-file")
              value: (flow_node
                (plain_scalar
                  (string_scalar) @injection.content)
                (#set! injection.language "gitignore")))))))))
