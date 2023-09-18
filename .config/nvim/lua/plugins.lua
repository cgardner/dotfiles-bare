local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PackerBootstrap =
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
--    vim.cmd [[packadd packer.nvim]]
end

local function is_firenvim()
    return vim.g.started_by_firenvim == true
end
local function is_not_firenvim()
    return vim.g["started_by_firenvim"] == nil
end

local packer = require("packer")
packer.reset()
packer.startup(
    {
        function(use)
            use {"wbthomason/packer.nvim"}
            use {
                "eddyekofo94/gruvbox-flat.nvim",
                config = require("plugins/gruvbox-flat").config,
                cond = is_not_firenvim
            }
            use {
                "neovim/nvim-lspconfig",
                "williamboman/nvim-lsp-installer",
                cond = is_not_firenvim
            }
            use {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/nvim-cmp",
                cond = is_not_firenvim
            }

            use {
                "sirver/UltiSnips",
                requires = {
                    "honza/vim-snippets",
                    "quangnguyen30192/cmp-nvim-ultisnips"
                },
                config = require("plugins.ultisnips").config,
                cond = is_not_firenvim
            }
            use {
                "kyazdani42/nvim-tree.lua",
                requires = "kyazdani42/nvim-web-devicons",
                config = require("plugins/nvim-tree").config,
                cond = is_not_firenvim
            }
            use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = require("plugins/nvim-treesitter").config,
                cond = is_not_firenvim
            }
            use {"tpope/vim-commentary", "tpope/vim-surround"}
            use {
                "iamcco/markdown-preview.nvim",
                run = "cd app && yarn install",
                ft = {"markdown"},
                cond = is_not_firenvim
            }
            use {
                "plasticboy/vim-markdown",
                ft = {"markdown", "telekasten"},
                requires = "godlygeek/tabular",
                cond = is_not_firenvim
            }
            use {
                "glacambre/firenvim",
                disable = false,
                run = function()
                    vim.fn["firenvim#install"](0)
                end,
                config = require("plugins/firenvim").config,
                cond = is_firenvim
            }
            use {
                "feline-nvim/feline.nvim",
                config = require("plugins/feline").config,
                cond = is_not_firenvim
            }
            use {
                "mattn/emmet-vim",
                cond = is_not_firenvim
            }
            use {
                "fatih/vim-go",
                cond = is_not_firenvim
            }
            use {
                "sbdchd/neoformat",
                config = require("plugins/neoformat").config,
                cond = is_not_firenvim
            }
            use {
                "tpope/vim-fugitive",
                cond = is_not_firenvim
            }
            use {
                "folke/zen-mode.nvim",
                config = require("plugins.zen-mode").config,
                cond = is_not_firenvim
            }
            use {
                "folke/twilight.nvim",
                config = require("plugins.twilight").config,
                cond = is_not_firenvim
            }
            use {
                "github/copilot.vim",
                cond = is_not_firenvim,
                config = require("plugins.copilot").config
            }
            use {
              'stevearc/aerial.nvim',
              config = function() require('aerial').setup() end
            }
            -- Auto run sync if first time install
            if packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = require("packer.util").float,
                prompt_border = "single",
                compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
            }
        }
    }
)
