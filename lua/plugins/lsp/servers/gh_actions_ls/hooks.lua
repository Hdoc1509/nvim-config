local M = {}

local github_api_url = 'https://api.github.com/repos/'
local notify_title = 'gh_actions_ls'

local function parse_repo_origin(origin)
  return vim.trim(origin:gsub('https://github%.com/', ''):gsub('%.git', ''))
end

local setup_repos = function(config)
  if config.name == 'gh_actions_ls' then
    -- PERF: vim.fn.system() is blocking

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

    local repo_data = vim.json.decode(repo_json)
    if repo_data == nil then
      vim.notify('Error while parsing json repo data', 'error', { title = notify_title })
      return
    end

    table.insert(config.init_options.repos, {
      id = repo_data.id,
      owner = repo_data.owner.login,
      name = repo_data.name,
      workspaceUri = vim.uri_from_fname(vim.fn.getcwd() .. '/.github/workflows'),
      organizationOwned = repo_data.owner.type == 'Organization',
    })
  end
end

M.before = { setup_repos }

return M
