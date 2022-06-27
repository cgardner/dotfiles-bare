local M = {}

local function config()
    require("zen-mode").setup {
        window = {
            width = 130
        },
        plugins = {
            tmux = {
                enabled = true
            },
            twilight = {
                enabled = true
            }
        },
        on_open = function()
            vim.cmd [[:LspStop]]
        end
    }
end

M.config = config

return M
