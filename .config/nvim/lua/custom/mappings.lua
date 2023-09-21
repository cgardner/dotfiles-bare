---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["C-h"] = { "k", "Move up" },
    ["C-j"] = { "h", "Move right" },
    ["C-k"] = { "j", "Move down" },
  },
  n = {
    ["<leader> a"] = { "ggvg", "Select All", opts = { silent = true } },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["h"] = { "k", "Move up" },
    ["j"] = { "h", "Move right" },
    ["k"] = { "j", "Move down" },

    ["<C-k>"] = { "<C-w>j", "Window up" },
    ["<C-h>"] = { "<C-w>k", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>h", "Window down" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["h"] = { "k", "Move up" },
    ["j"] = { "h", "Move right" },
    ["l"] = { "l", "Move left" },
    ["k"] = { "j", "Move down" },
  },
  x = {
    ["h"] = { "k", "Move up" },
    ["j"] = { "h", "Move right" },
    ["l"] = { "l", "Move left" },
    ["k"] = { "j", "Move down" },
  },
}

M.configs = {
  n = {
    ["<leader>ev"] = { ":edit $MYVIMRC<CR>", "Edit vim config", opts = { silent = true } },
    ["<leader>sv"] = { ":source $MYVIMRC<CR>", "Reload vim config", opts = { silent = true } },
  },
}

-- more keybinds!

return M
