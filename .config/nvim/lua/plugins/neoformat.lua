local M = {}

function config()
    vim.api.nvim_set_keymap("n", "<C-f>", ":Neoformat<CR>", {})
end
M.config = config

return M
