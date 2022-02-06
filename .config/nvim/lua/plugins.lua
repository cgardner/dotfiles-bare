local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PackerBootstrap =
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    vim.cmd [[packadd packer.nvim]]
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
            use {
                "eddyekofo94/gruvbox-flat.nvim",
                config = require("plugins/gruvbox-flat").config
            }
            use {
                "neovim/nvim-lspconfig",
                "williamboman/nvim-lsp-installer"
            }
            use {
                "hrsh7th/nvim-cmp",
                requires = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path"
                    -- "hrsh7th/cmp-cmdline",
                },
                conifg = require("plugins.nvim_cmp").config
            }
            -- use {"ms-jpq/coq_nvim", "ms-jpq/coq.artifacts", disable = false}

            use {
                "sirver/UltiSnips",
                requires = {
                    "honza/vim-snippets",
                    "quangnguyen30192/cmp-nvim-ultisnips"
                },
                config = require("plugins.ultisnips").config
            }
            use {
                "renerocksai/telekasten.nvim",
                requires = {
                    {
                        "nvim-telescope/telescope.nvim",
                        config = require("plugins/telescope").config
                    },
                    "nvim-lua/plenary.nvim"
                },
                config = require("plugins/telekasten").config
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
                config = require("plugins/nvim-treesitter").config
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
                ft = {"markdown"},
                requires = "godlygeek/tabular"
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
                "konapun/vacuumline.nvim",
                branch = "next",
                requires = {
                    "glepnir/galaxyline.nvim",
                    branch = "main",
                    "kyazdani42/nvim-web-devicons",
                    opt = true
                },
                config = require("plugins/vacuumline").config,
                cond = is_not_firenvim
            }
            use {
                "ledger/vim-ledger",
                cond = is_not_firenvim
            }
            use {
                "mattn/emmet-vim",
                cond = is_not_firenvim
            }

            use {
                "sbdchd/neoformat",
                config = require("plugins/neoformat").config
            }
        end,
        config = {
            display = {
                open_fn = require("packer.util").float,
                prompt_border = "single"
            }
        }
    }
)
