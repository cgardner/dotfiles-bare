local M = {}

local function config()
  vim.g.copilot_filetypes = {
    ["*"] = true,
    markdown = false,
    telekasten = false,
  };
end
M.config = config

return M
