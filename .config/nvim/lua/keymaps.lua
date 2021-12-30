vim.cmd[[let mapleader=","]]
-- Colemak {{{
vim.api.nvim_set_keymap('', 'K', 'J', {noremap = true})
vim.api.nvim_set_keymap('', 'J', 'K', {noremap = true})

vim.api.nvim_set_keymap('', 'h', 'k', {noremap = true})
vim.api.nvim_set_keymap('', 'j', 'h', {noremap = true})
vim.api.nvim_set_keymap('', 'k', 'j', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-W>h', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-W>j', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-W>k', ':wincmd j<CR>', {noremap = true})
-- }}}

vim.api.nvim_set_keymap('', '<leader>a', 'ggVG', {silent = true})
vim.api.nvim_set_keymap('n', ';', ':', {silent = true})

-- Manage config {{{
vim.api.nvim_set_keymap('n', '<leader>ev', ':edit $MYVIMRC<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', {silent = true})
-- }}}
-- Clear highlights {{{
vim.api.nvim_set_keymap('', '<leader>/', ':nohls<CR>', {noremap = true, silent = true})
-- }}}
