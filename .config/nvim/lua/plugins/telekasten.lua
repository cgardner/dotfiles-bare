local M = {}

local function config()
    local home = vim.fn.expand("$HOME/Documents/work")
    local template_dir = vim.fn.expand(home .. "/Templates")
    local telekasten = require("telekasten")
    telekasten.setup(
        {
            home = home,
            install_syntax = true,
            -- take_over_my_home = false,
            extension = ".md",
            dailies = home .. "/daily",
            weeklies = home .. "/weekly",
            templates = template_dir,
            template_new_note = template_dir .. "/Note.md",
            template_new_daily = template_dir .. "/Daily.md",
            template_new_weekly = template_dir .. "/Weekly.md",
            command_palette_theme = "dropdown",
            show_tags_theme = "dropdown"
        }
    )

    local opts = {silent = true, noremap = true}
    vim.api.nvim_set_keymap("n", "<leader>zp", ":Telekasten<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zf", ":Telekasten find_notes<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zF", ":Telekasten find_friends<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zn", ":Telekasten new_note<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zN", ":Telekasten new_templated_note<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zz", ":Telekasten follow_link<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zt", ":Telekasten show_tags<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zT", ":Telekasten goto_today<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>zl", ":Telekasten insert_link<CR>", opts)
    vim.api.nvim_set_keymap("n", "<space>t", ":Telekasten toggle_todo()<CR>", opts)

    vim.api.nvim_set_keymap(
        "n",
        "<leader>[",
        "lua require('telekasten').insert_link({i=true})<CR>",
        opts
    )
end
M.config = config

return M
