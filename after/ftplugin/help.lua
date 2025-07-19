local utils = require('utils')

utils.nmap('<cr>', '<c-]>', { buffer = 0, desc = 'Jump to tag' })
utils.nmap('<bs>', '<c-T>', { buffer = 0, desc = 'Jump to previous tag' })
