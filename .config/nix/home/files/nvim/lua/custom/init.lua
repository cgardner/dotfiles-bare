local g = vim.g
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
g.mapleader = ","

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.swapfile = false
vim.o.shell = "zsh"
vim.cmd([[ set nofoldenable ]])
vim.o.scrolloff = 9999


vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
