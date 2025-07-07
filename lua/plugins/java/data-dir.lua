local cache_dir = vim.fn.expand('~/.cache/jdtls/workspace')

local function get_data_dir(root_dir)
  local workspace_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
  -- useful if branches have different configs
  -- NOTE: clean eclipse and gradle generated files every time you switch branch
  -- reference: https://github.com/Hdoc1509/hotbar-keys/tree/1.21.3/scripts/clean.sh
  local branch = vim.fn['gitbranch#name']()

  if branch ~= '' then
    workspace_name = workspace_name .. '_branch-' .. branch
  end

  return cache_dir .. '/' .. workspace_name
end

return { get_data_dir = get_data_dir }
