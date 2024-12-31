M = {}

---@param workspace_path string
M.get_from_gradle_properties = function(workspace_path)
  if vim.fn.filereadable(workspace_path .. '/gradle.properties') == 0 then
    return nil
  end

  local gradle_properties = vim.fn.readfile(workspace_path .. '/gradle.properties', '', 20)

  if gradle_properties == nil then
    return nil
  end

  local line_with_version = vim.fn.filter(gradle_properties, function(_, line)
    local _, _, _version = string.find(line, 'java_version=(%d+)')
    return _version ~= nil
  end)[1]

  if line_with_version == nil then
    return nil
  end

  return string.match(line_with_version, '%d+') --[[@as string]]
end

return M
