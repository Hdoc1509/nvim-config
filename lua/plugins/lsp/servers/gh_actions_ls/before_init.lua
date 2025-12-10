local github_api_url = 'https://api.github.com/repos/'
local notify_title = 'gh_actions_ls'
local cache_file = vim.fn.expand('~/.cache/gh_actions_ls.json')

local function parse_repo_origin(origin)
  return vim.trim(origin:gsub('https://github%.com/', ''):gsub('%.git', ''))
end

local setup_repos = function(config)
  local repo_data = {}
  local workspace_uri = vim.uri_from_fname(vim.fn.getcwd() .. '/.github/workflows')
  local cached = vim.fn.system({ 'jq', '.', cache_file })
  local cached_data = nil

  if vim.v.shell_error == 0 then
    cached_data = vim.json.decode(cached)
  end

  if cached_data ~= nil and cached_data ~= vim.NIL and cached_data[workspace_uri] ~= nil then
    repo_data = cached_data[workspace_uri]
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

    local fetched_repo = vim.json.decode(repo_json)
    if fetched_repo == nil then
      vim.notify('Error while parsing json repo data', 'error', { title = notify_title })
      return
    end

    repo_data = {
      id = fetched_repo.id,
      owner = fetched_repo.owner.login,
      name = fetched_repo.name,
      workspaceUri = workspace_uri,
      organizationOwned = fetched_repo.owner.type == 'Organization',
    }

    local data_to_cache = vim.tbl_deep_extend('force', cached_data or {}, {
      [workspace_uri] = repo_data,
    })

    local encoded = vim.json.encode(data_to_cache)
    vim.fn.writefile({ encoded }, cache_file, 'S')
  end

  table.insert(config.init_options.repos, repo_data)
end

---@type vim.lsp.client.before_init_cb
local function before_init(_, config)
  setup_repos(config)
end

return before_init
