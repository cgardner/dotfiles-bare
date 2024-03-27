-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local apex = vim.api.nvim_create_augroup("apex", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.cls", "*.trigger" },
  callback = function()
    vim.bo.ft = "apex"
    vim.bo.commentstring = "// %s"
  end,
  group = apex,
})

local gitStream = vim.api.nvim_create_augroup("gitStream", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.cm" },
  callback = function()
    vim.bo.ft = "yaml"
    vim.b.autoformat = false
  end,
  group = gitStream,
})
