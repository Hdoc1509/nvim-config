local M = {}

local github_api_url = 'https://api.github.com/repos/'
local notify_title = 'gh_actions_ls'
local cache_file = vim.fn.expand('~/.cache/gh_actions_ls.json')

local function parse_repo_origin(origin)
  return vim.trim(origin:gsub('https://github%.com/', ''):gsub('%.git', ''))
end

local setup_repos = function(config)
  if config.name ~= 'gh_actions_ls' then
    return
  end
  -- PERF: vim.fn.system() is blocking

  local repo_data = {}
  local workspace_uri = vim.uri_from_fname(vim.fn.getcwd() .. '/.github/workflows')
  local cached = vim.fn.system({ 'jq', '.["' .. workspace_uri .. '"]', cache_file })

  if vim.v.shell_error == 0 then
    local decoded = vim.json.decode(cached)

    if decoded ~= nil then
      repo_data = decoded
    end
  else
    -- NOTE: maybe github cli will be needed to fetch private repos
    -- https://stackoverflow.com/questions/13902593/how-does-one-find-out-ones-own-repo-id/74529107
    local remote_origin = vim.fn.system({ 'git', 'remote', 'get-url', 'origin' })
    if vim.v.shell_error > 0 then
      vim.notify('Not in a git repository', 'warning', { title = notify_title })
      return
    end

    if remote_origin:match('github%.com') == nil then
      vim.notify('Not a Github repository', 'warning', { title = notify_title })
      return
    end

    local repo_full_name = parse_repo_origin(remote_origin)
    local repo_json = vim.fn.system({ 'curl', '-s', github_api_url .. repo_full_name })

    if vim.v.shell_error > 0 then
      vim.notify('Error while fetching repo data', 'error', { title = notify_title })
      return
    end

    local decoded = vim.json.decode(repo_json)
    if decoded == nil then
      vim.notify('Error while parsing json repo data', 'error', { title = notify_title })
      return
    end

    repo_data = {
      id = decoded.id,
      owner = decoded.owner.login,
      name = decoded.name,
      workspaceUri = workspace_uri,
      organizationOwned = decoded.owner.type == 'Organization',
    }

    local encoded = vim.json.encode({ [workspace_uri] = repo_data })
    vim.fn.writefile({ encoded }, cache_file, 'S')
  end

  table.insert(config.init_options.repos, repo_data)
end

M.before = { setup_repos }

return M
