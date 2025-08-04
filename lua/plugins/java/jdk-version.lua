local M = {}

---@param workspace_path string
M.get_from_gradle_properties = function(workspace_path)
  if vim.fn.filereadable(workspace_path .. '/gradle.properties') == 0 then
    return nil
  end

  local gradle_properties = vim.fn.readfile(workspace_path .. '/gradle.properties', '', 20)

  for _, line in ipairs(gradle_properties) do
    local _, _, version = line:find('^java_version=(%d+)')

    if version ~= nil then
      return version --[[@as string]]
    end
  end
end

---@param workspace_path string
M.get_from_sdkmanrc = function(workspace_path)
  if vim.fn.filereadable(workspace_path .. '/.sdkmanrc') == 0 then
    return nil
  end

  local sdkmanrc = vim.fn.readfile(workspace_path .. '/.sdkmanrc', '', 20)

  for _, line in ipairs(sdkmanrc) do
    local _, _, version = line:find('^java=(.+)')

    if version ~= nil then
      return version --[[@as string]]
    end
  end
end

return M
