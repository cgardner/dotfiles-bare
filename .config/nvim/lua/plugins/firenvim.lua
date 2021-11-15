local M = { }

local function config()
      vim.cmd[[let g:firenvim_config = { "globalSettings": { "alt": "all", }, "localSettings": { ".*": { "cmdline": "neovim", "content": "text", "priority": 0, "selector": "textarea", "takeover": "always", }, } }]]
      vim.cmd('let fc = g:firenvim_config["localSettings"]')
      vim.cmd[[let fc["https?://projects.cdk.com/"] = { "takeover": "never", "priority": 1 }]]
      vim.cmd[[let fc["https?://stash.cdk.com/"] = { "takeover": "never", "priority": 1 }]]
      vim.cmd[[let fc["https?://sonar.cdk.com/"] = { "takeover": "never", "priority": 1 }]]
end
M.config = config

return M
