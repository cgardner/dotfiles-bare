return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    init = function()
      vim.g.gruvbox_contrast_dark = "hard"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
