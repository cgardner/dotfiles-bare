local M = {}

local function config()
    vim.api.nvim_set_keymap("n", "<C-f>", ":Neoformat<CR>", {})
    vim.g.neoformat_telekasten_prettier = {
      exe = "prettier",
      args = {"--stdin-filepath", '"%:p"'},
      stdin = 1,
      try_node_exe = 1,
    }
    vim.g.neoformat_enabled_telekasten = {"prettier"}

    vim.g.neoformat_ledger_ledger = {
      exe = "ledger",
      args = {"-f", "- print"}
    }
    vim.g.neoformat_enabled_ledger = {"ledger"}
end
M.config = config

return M
