-- handy variables
command = vim.cmd
global = vim.g
options = vim.opt

-- load nvim config
require('globals.ide-config')

-- load remaps
require('globals.ide-remaps')

-- load nvim-cmp config
require('lsp.cmp-config')

-- load lsp config
require('lsp.lsp-config')

-- load plugins
require('plugins')
