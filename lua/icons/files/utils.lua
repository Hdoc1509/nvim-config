local devicons = require('nvim-web-devicons')

local M = {}

---@param filetype string
---@return string icon, string color, string hl
local function icon_by_filetype(filetype)
  local icon, color = devicons.get_icon_color_by_filetype(filetype, {
    default = true,
  })
  local _, hl = devicons.get_icon_by_filetype(filetype, { default = true })

  return icon, color, hl
end

---Returns the `icon`, `color` and `hl` group from file without extension
---@param file string | number Full path of file of buffer number
---@return string icon, string color, string hl
function M.get_icon_without_extension(file)
  if type(file) == 'number' then
    return icon_by_filetype(vim.bo[file].filetype)
  end

  if type(file) == 'string' then
    ---@type string[]
    local lines = vim.fn.readfile(file, '', 1)

    if #lines == 0 then
      local basename = vim.fs.basename(file)
      local icon, color = devicons.get_icon_color(basename, '')
      local _, hl = devicons.get_icon(basename, '')

      if icon ~= nil and color ~= nil and hl ~= nil then
        return icon, color, hl
      end

      return icon_by_filetype('unknown')
    end

    local shell_shebang = lines[1]:match('^#!/bin/(%w+)')

    if shell_shebang ~= nil then
      return icon_by_filetype(shell_shebang)
    end

    local shell_shebang_env = lines[1]:match('^#!/usr/bin/env (%w+)')

    if shell_shebang_env ~= nil then
      return icon_by_filetype(shell_shebang_env)
    end

    local ft_modeline = lines[1]:match('.*vim:.*ft=(%w+)')

    if ft_modeline ~= nil then
      return icon_by_filetype(ft_modeline)
    end

    local filetype_modeline = lines[1]:match('.*vim:.*filetype=(%w+)')

    if filetype_modeline ~= nil then
      return icon_by_filetype(filetype_modeline)
    end

    local basename = vim.fs.basename(file)
    local icon, color = devicons.get_icon_color(basename, '')
    local _, hl = devicons.get_icon(basename, '')

    if icon ~= nil and color ~= nil and hl ~= nil then
      return icon, color, hl
    end
  end

  return icon_by_filetype('unknown')
end

return M
