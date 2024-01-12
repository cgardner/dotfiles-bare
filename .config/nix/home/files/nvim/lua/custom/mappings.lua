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

    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["h"] = { "k", "Move up" },
    ["j"] = { "h", "Move right" },
    ["k"] = { "j", "Move down" },

    ["<C-k>"] = { "<C-w>j", "Window up" },
    ["<C-h>"] = { "<C-w>k", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>h", "Window down" },
    ["<leader> space n"] = { ":bnext<CR>", "Next Buffer" },
    ["<leader> space p"] = { ":bprev<CR>", "Previous Buffer" },
  },
  v = {
    [">"] = { ">gv", "Indent" },
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

M.aerial = {
  n = {
    ["<leader>a"] = { ":AerialToggle left<CR>", "Toggle Outline" },
  },
}

M.configs = {
  n = {
    ["<leader>ev"] = { ":edit $MYVIMRC<CR>", "Edit vim config", opts = { silent = true } },
    ["<leader>sv"] = { ":source $MYVIMRC<CR>", "Reload vim config", opts = { silent = true } },
  },
}

M.lspconfig = {
  n = {
    ["C-K"] = { "K", "vim.lspconfig.hover()" },
  },
}

M.debugging = {
  n = {
    ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["<leader>dc"] = { ":lua require('dap').continue()<CR>", "Continue" },
    ["<leader>dr"] = { ":lua require('dap').repl.open()<CR>", "Open REPL" },
    ["<leader>dl"] = { ":lua require('dap').run_last()<CR>", "Run last" },
    ["<leader>ds"] = { ":lua require('dap').step_over()<CR>", "Step over" },
    ["<leader>di"] = { ":lua require('dap').step_into()<CR>", "Step into" },
    ["<leader>do"] = { ":lua require('dap').step_out()<CR>", "Step out" },
    ["<leader>du"] = { ":lua require('dapui').toggle()<CR>", "Toggle UI" },
  },
}

M.nvterm = {
  plugin = true,
  n = {
    ["<leader>tv"] = {

      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
    ["<M-h>"] = { "" },
    ["<M-v>"] = { "" },
    ["<Esc-h>"] = { "" },
    ["<Esc-v>"] = { "" },
  },
}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<M-h>"] = "",
    ["<M-v>"] = "",
    ["<Esc-h>"] = "",
    ["<Esc-v>"] = "",
    ["<Esc>h"] = "",
    ["<Esc>v"] = "",
  },
  t = {
    ["<M-h>"] = "",
    ["<M-v>"] = "",
    ["<Esc-h>"] = "",
    ["<Esc-v>"] = "",
    ["<Esc>h"] = "",
    ["<Esc>v"] = "",
  },
}

-- more keybinds!

return M
