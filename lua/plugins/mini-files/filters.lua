local M = {}

local show_dotfiles = true
local show_excluded = false
local excluded = { 'node_modules', '.git', 'dist' }

local find_string_in = function(list, str)
  for _, element in ipairs(list) do
    if element == str then
      return true
    end
  end

  return false
end

local show_all_files = function()
  return true
end

local hide_dotfiles = function(fs_entry)
  return not vim.startswith(fs_entry.name, '.')
end

M.hide_excluded = function(fs_entry)
  return not find_string_in(excluded, fs_entry.name)
end

M.toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and show_all_files or hide_dotfiles
  MiniFiles.refresh({ content = { filter = new_filter } })
end

M.toggle_exclude = function()
  show_excluded = not show_excluded
  local new_filter = show_excluded and show_all_files or M.hide_excluded
  MiniFiles.refresh({ content = { filter = new_filter } })
end

return M
