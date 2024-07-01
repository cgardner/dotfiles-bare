-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.cm" },
  callback = function()
    vim.bo.ft = "yaml"
    vim.bo.autoformat = false
  end,
  group = augroup("gitStream"),
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = augroup("autoupdate"),
  callback = function()
    print("hello")
    require("lazy").update({ show = false })
  end,
})
