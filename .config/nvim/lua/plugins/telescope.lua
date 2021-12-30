local M = {}
local function config()
    function Get_theme()
        local theme =
            require("telescope.themes").get_dropdown(
            {
                layout_config = {
                    width = 0.8
                },
                winblend = 10,
                -- prompt_title = '',
                -- prompt_prefix = 'Files>',
                previewer = false
            }
        )

        return theme
    end

    function Finder()
        local theme = Get_theme()
        require "telescope.builtin".find_files(theme)
    end
    vim.api.nvim_set_keymap("n", "<C-p>", ":lua Finder()<CR>", {})
end
M.config = config

M.init = function()
    vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {})
end

return M
