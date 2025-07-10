local lsp_util = vim.lsp.util
local floating_preview_id = nil

---@param responses table<integer, { error: lsp.ResponseError, result: any }>
local function request_handler(responses)
  --- use `gF` to jump to file
  --- based on $VIMRUNTIME/lua/vim/lsp/handlers.lua:351
  local value = {}
  -- local value = ''

  -- for client_id, response in pairs(responses) do
  for _, response in pairs(responses) do
    -- local client = vim.lsp.get_client_by_id(client_id)
    local result = response.result

    -- print('client: ', client.name)
    -- print('result: ', vim.inspect(result))

    -- TODO: add a way to ensure not repeating the same content
    -- some lsp servers return the same content
    -- contents can be:
    -- - string
    -- - { value: string }
    -- - (string | { value: string })[]

    if result ~= nil and result.contents ~= nil then
      local md_lines = lsp_util.convert_input_to_markdown_lines(result.contents)

      if not vim.tbl_isempty(value) then
        table.insert(value, '---')
      end

      if not vim.tbl_isempty(md_lines) then
        for _, line in ipairs(md_lines) do
          table.insert(value, line)
        end
      end
    end
  end

  if not vim.tbl_isempty(value) then
    -- FIX: auto-focus to preview window start to work after third call
    if floating_preview_id ~= nil then
      local _, winnr = lsp_util.open_floating_preview(value, 'markdown', {
        border = 'rounded',
        focus_id = tostring(vim.fn.win_getid(floating_preview_id)),
      })

      floating_preview_id = winnr
    else
      local _, winnr = lsp_util.open_floating_preview(value, 'markdown', {
        border = 'rounded',
      })

      floating_preview_id = winnr
    end
  end
end

---@param bufnr integer
return function(bufnr)
  local position_params = lsp_util.make_position_params()

  vim.lsp.buf_request_all(bufnr, 'textDocument/hover', position_params, request_handler)
end
