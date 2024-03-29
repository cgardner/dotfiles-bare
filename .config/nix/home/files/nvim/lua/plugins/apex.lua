local apex = vim.api.nvim_create_augroup("apex", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.cls", "*.trigger" },
  callback = function()
    vim.bo.ft = "apex"
    vim.bo.commentstring = "// %s"
  end,
  group = apex,
})
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "apex" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- for apex-language-server validation
      vim.list_extend(opts.ensure_installed, { "apex-language-server" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        apex_ls = {
          filetypes = { "apex" },
        },
      },
    },
  },
}
