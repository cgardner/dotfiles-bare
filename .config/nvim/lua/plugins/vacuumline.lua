local M = { }

local function config()
  require('vacuumline').setup({theme = require('vacuumline.theme.gruvbox')})
end
M.config = config

return M
