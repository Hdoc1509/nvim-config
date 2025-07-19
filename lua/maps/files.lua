local nmap = require('utils').nmap

-- Save and quit files
nmap('<leader>w', '<cmd>update ++p<cr>', { desc = 'Save file' })
nmap('<leader>W', '<cmd>wall<cr>', { desc = 'Save all files' })
nmap('<leader>q', '<cmd>xit<cr>', { desc = 'Save and close file' })
nmap('<leader>Q', '<cmd>xall<cr>', { desc = 'Save all files and close Neovim' })
