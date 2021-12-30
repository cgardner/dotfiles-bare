require('plugins')
vim.cmd[[filetype plugin on]]
vim.cmd[[set title]]
vim.cmd[[set number]]
vim.cmd[[set relativenumber]]
vim.cmd[[syntax enable]]
vim.cmd[[set tabstop=2]]
vim.cmd[[set shiftwidth=2]]
vim.cmd[[set autoindent]]
vim.cmd[[set smartindent]]
vim.cmd[[set expandtab]]
vim.cmd('set guifont="FiraCode\\ Nerd\\ Font\\ Retina:h18"')
vim.cmd[[let g:coq_settings = { 'auto_start': 'shut-up' }]]

vim.opt.clipboard = 'unnamedplus'
vim.opt.textwidth = 120
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wildignore = "*.swp,*.bak"
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.g.incserarch = true

require('plugins.firenvim').init()
require('plugins.telescope').init()
require('plugins.markdown-preview').init()
require('keymaps')
require('lsp')