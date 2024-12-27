local autocmd = require('utils').autocmd

local function config()
  -- Add auto-pairs for HTML comment
  autocmd('FileType', {
    pattern = { 'html', 'markdown' },
    callback = function()
      vim.cmd("let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})")
    end,
  })

  -- Add auto-pairs for React.Fragment
  autocmd('FileType', {
    pattern = { 'javascriptreact', 'typescriptreact' },
    callback = function()
      vim.cmd("let b:AutoPairs = AutoPairsDefine({'<>':'</>'})")
    end,
  })

  -- Add auto-pairs for ejs
  autocmd('FileType', {
    pattern = 'ejs',
    callback = function(ev)
      vim.b[ev.buf].AutoPairs = vim.fn['AutoPairsDefine']({
        ['<%'] = '%>',
        ['<%='] = '%>',
        ['<%-'] = '%>',
        ['<%#'] = '%>',
      })
    end,
  })

  -- add auto-pairs for mdx
  autocmd('FileType', {
    pattern = 'markdown.mdx',
    callback = function ()
      -- pairs for comments
      vim.cmd("let b:AutoPairs = AutoPairsDefine({'{/*':'*/}'})")
    end
  })
end

return {
  'jiangmiao/auto-pairs',
  enabled = false,
  config = config,
}
