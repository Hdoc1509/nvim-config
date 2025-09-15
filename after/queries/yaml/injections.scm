; extends

(block_mapping_pair
  value: [
    (block_node
      (block_scalar) @injection.content)
    (flow_node
      [
        (plain_scalar
          (string_scalar) @injection.content)
        (double_quote_scalar) @injection.content
      ])
  ]
  (#lua-match? @injection.content "${{")
  (#set! injection.language "githubactions"))

(block_mapping_pair
  key: (flow_node) @_key
  (#eq? @_key "if")
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#not-lua-match? @injection.content "^${{")
    (#set! injection.language "githubactions")))

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
                        (double_quote_scalar) @injection.content
                        (plain_scalar
                          ; FIX: this breaks with offset below
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
              ]
              ; NOTE: check if this breaks something
              (#offset! @injection.content 0 1 0 -1)
              (#set! injection.language "gitignore"))))))))

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

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_uses
        (#eq? @_uses "uses")
        value: (flow_node) @_action
        (#lua-match? @_action "^peaceiris/actions%-gh%-pages"))
      (block_mapping_pair
        key: (flow_node) @_with
        (#eq? @_with "with")
        value: (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_publish_dir
              (#eq? @_publish_dir "publish_dir")
              value: (flow_node
                (plain_scalar
                  (string_scalar) @injection.content)
                (#set! injection.language "gitignore")))))))))
