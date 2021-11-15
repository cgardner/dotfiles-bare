local M = {}

local function config()
    require'nvim-tree'.setup {
      disable_netrw = false,
      hijiack_netrw = false,
    }
end
M.config = config

return M
