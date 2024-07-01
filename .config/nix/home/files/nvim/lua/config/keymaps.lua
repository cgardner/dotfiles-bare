-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local unmap = vim.keymap.del
local map = vim.keymap.set

map({ "n", "x" }, ";", ":", { noremap = true })

map({ "n", "x" }, "h", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- Up
map({ "n", "x" }, "k", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }) -- Down
map({ "n", "x" }, "j", "'h'", { expr = true, silent = true, noremap = true }) -- Left
-- map({ "n", "x" }, "l", "v:count == 0 ? 'gl' : 'l'", { expr = true, silent = true, noremap = true }) -- Right

if vim.g.vscode == false then
  unmap("n", "<C-_>")
  unmap("n", "<C-/>")
  map("n", "<C-_>", function()
    Util.terminal(nil, { border = "rounded", size = { width = 0.5, height = 0.5 } })
  end, { desc = "Terminal" })
end

map("n", "<leader>ft", function()
  Util.terminal(nil, { border = "rounded", size = { width = 0.5, height = 0.5 }, cwd = LazyVim.root.get() })
end, { desc = "Terminal (cwd)" })

map("n", "<leader>fT", function()
  Util.terminal(nil, { border = "rounded", size = { width = 0.5, height = 0.5 } })
end, { desc = "Terminal (cwd)" })
