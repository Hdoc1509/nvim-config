local M = {}

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

---@param workspace_path string
M.get_from_sdkmanrc = function(workspace_path)
  if vim.fn.filereadable(workspace_path .. '/.sdkmanrc') == 0 then
    return nil
  end

  local sdkmanrc = vim.fn.readfile(workspace_path .. '/.sdkmanrc', '', 20)

  if sdkmanrc == nil then
    return nil
  end

  local line_with_version = vim.fn.filter(sdkmanrc, function(_, line)
    local _, _, version = string.find(line, 'java=(.+)')
    return version ~= nil
  end)[1]

  if line_with_version == nil then
    return nil
  end

  local _, _, version = string.find(line_with_version, 'java=(.+)')

  return version --[[@as string]]
end

return M
