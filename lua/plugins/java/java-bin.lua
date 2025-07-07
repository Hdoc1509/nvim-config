local jdk_version = require('plugins.java.jdk-version')

local default_java_version = '21'
local sdkman_java_path = '~/.sdkman/candidates/java'

local function get_java_bin(root_dir)
  local java_sdkman = jdk_version.get_from_sdkmanrc(root_dir)

  if java_sdkman == nil then
    local java_version = jdk_version.get_from_gradle_properties(root_dir) or default_java_version

    return vim.fn.expand(sdkman_java_path .. '/' .. java_version .. '.*-tem/bin/java')
  else
    return vim.fn.expand(sdkman_java_path .. '/' .. java_sdkman .. '/bin/java')
  end
end

return { get_java_bin = get_java_bin }
