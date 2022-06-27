local M = {}

local function config()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {"go", "lua", "javascript"},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true
        },
        incremental_selection = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
end
M.config = config

local function init()
    vim.cmd [[set foldmethod=expr]]
    vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
end
M.init = init

return M
