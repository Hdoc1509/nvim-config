-- NOTE: needed for tree-sitter-test. not needed from nvim-0.10
if vim.fs.joinpath == nil then

  --- Concatenate directories and/or file paths into a single path with normalization
  --- (e.g., `"foo/"` and `"bar"` get joined to `"foo/bar"`)
  ---
  ---@param ... string
  ---@return string
  function vim.fs.joinpath(...)
    return (table.concat({ ... }, '/'):gsub('//+', '/'))
  end
end
