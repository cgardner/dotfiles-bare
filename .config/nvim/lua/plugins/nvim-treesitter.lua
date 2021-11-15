local M = { }

local function config()
    vim.cmd[[set foldmethod=expr]]
    vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
    require'nvim-treesitter.configs'.setup {
      ensure_installed = 'maintained',
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
      incremental_selection = {
        enable = true
      },
      indent = {
        enable = true
      },
    }
end
M.config = config

return M
