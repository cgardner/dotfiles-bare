local M = {}

local function config()
    vim.api.nvim_set_keymap("n", "<C-f>", ":Neoformat<CR>", {})

    vim.g.neoformat_ledger_ledger = {
      exe = "ledger",
      args = {"-f", "- print"}
    }
    vim.g.neoformat_enabled_ledger = {"ledger"}
end
M.config = config

return M
