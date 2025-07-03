; extends

(full_reference_link
  (link_text
    (image
      (image_description) @injection.content
      (#lua-match? @injection.content "<%%=")
      (#inject-hygen-ejs!))))
