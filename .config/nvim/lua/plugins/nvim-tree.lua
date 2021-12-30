local M = {}

local function config()
    require'nvim-tree'.setup {
      disable_netrw = false,
      hijiack_netrw = false,
      filters = {
        dotfiles = true,
        custom = {".git", ".gitignore"},
      },
    }
    vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', {})
end
M.config = config

return M
