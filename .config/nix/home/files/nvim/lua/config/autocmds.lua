-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local gitStream = vim.api.nvim_create_augroup("gitStream", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.cm" },
  callback = function()
    vim.bo.ft = "yaml"
    vim.b.autoformat = false
  end,
  group = gitStream,
})
