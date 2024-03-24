vim.filetype.add({
  extension = {
    ejs = 'ejs',
  },
  pattern = {
    ['.*.ejs.*'] = { 'ejs', { priority = 10 } },
  },
})
